using System;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using PartnerOrderSystem.DataBase;

namespace PartnerOrderSystem
{
    public partial class MaterialCalculationWindow : Window
    {
        private var3Entities _context = new var3Entities();
        private int _orderId; // Храним переданный идентификатор заказа

        public MaterialCalculationWindow(int orderId)
        {
            InitializeComponent();
            _orderId = orderId;

            LoadData();
            LoadOrderData();
        }

        private void LoadData()
        {
            _context.ProductTypes.Load();
            ProductTypeCombo.ItemsSource = _context.ProductTypes.Local;

            _context.MaterialTypes.Load();
            MaterialTypeCombo.ItemsSource = _context.MaterialTypes.Local;
        }

        private void LoadOrderData()
        {
            var order = _context.Applications
                .Include(a => a.ApplicationProducts.Select(ap => ap.Products))
                .FirstOrDefault(a => a.Id == _orderId);

            if (order != null && order.ApplicationProducts.Any())
            {
                var firstProduct = order.ApplicationProducts.First().Products;
                ProductTypeCombo.SelectedValue = firstProduct.ProductTypeId;
            }
        }

        private void CalculateButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int productTypeId = (int)ProductTypeCombo.SelectedValue;
                int materialTypeId = (int)MaterialTypeCombo.SelectedValue;
                int requiredQuantity = int.Parse(RequiredQuantityBox.Text);
                int stockQuantity = int.Parse(StockQuantityBox.Text);

                // Получаем параметры из базы данных
                var productMaterial = _context.ProductMaterials
                    .FirstOrDefault(pm =>
                        pm.ProductId == productTypeId &&
                        pm.MaterialId == materialTypeId);

                if (productMaterial == null)
                {
                    MessageBox.Show("Не найдены параметры для выбранных типа продукции и материала", "Ошибка");
                    return;
                }

                int result = CalculateMaterialRequired(
                    productTypeId, materialTypeId,
                    requiredQuantity, stockQuantity,
                    (double)productMaterial.Parameter1,
                    (double)productMaterial.Parameter2);

                ResultLabel.Content = result >= 0 ?
                    $"Необходимо: {result} единиц материала" :
                    "Ошибка в данных";
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка расчета: {ex.Message}", "Ошибка");
            }
        }

        private int CalculateMaterialRequired(
            int productTypeId, int materialTypeId,
            int requiredQuantity, int stockQuantity,
            double parameter1, double parameter2)
        {
            if (productTypeId <= 0 || materialTypeId <= 0 ||
                requiredQuantity <= 0 || parameter1 <= 0 || parameter2 <= 0)
                return -1;

            try
            {
                var productType = _context.ProductTypes.Find(productTypeId);
                var materialType = _context.MaterialTypes.Find(materialTypeId);

                if (productType == null || materialType == null)
                    return -1;

                double materialPerUnit = parameter1 * parameter2 * (double)productType.ProductionCoefficient;
                double defectFactor = 1 + ((double)materialType.DefectPercentage / 100);
                double totalMaterial = (requiredQuantity - Math.Min(stockQuantity, requiredQuantity)) *
                                      materialPerUnit *
                                      defectFactor;

                return (int)Math.Ceiling(totalMaterial);
            }
            catch
            {
                return -1;
            }
        }
    }
}