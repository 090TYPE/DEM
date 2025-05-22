using System;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using PartnerOrderSystem.DataBase;
using System.Windows.Controls;

namespace PartnerOrderSystem
{
    public partial class EditOrderWindow : Window
    {
        private var3Entities _context = new var3Entities();
        private Applications _currentOrder; // Используем правильное имя класса из вашей БД
        private bool _isNewOrder = false;


        public EditOrderWindow(int? orderId = null)
        {
            InitializeComponent();

            if (orderId == null)
            {
                _isNewOrder = true;
                _currentOrder = new Applications
                {
                    ApplicationDate = DateTime.Now,
                    Status = "Новая"
                };
                _context.Applications.Add(_currentOrder);
            }
            else
            {
                _currentOrder = _context.Applications
                    .Include(a => a.ApplicationProducts)
                    .Include(a => a.ApplicationProducts.Select(ap => ap.Products))
                    .FirstOrDefault(a => a.Id == orderId);
            }



            LoadData();
        }

        private void LoadData()
        {
            _context.Partners.Load();
            PartnerCombo.ItemsSource = _context.Partners.Local;

            StatusCombo.SelectedItem = StatusCombo.Items
                .Cast<ComboBoxItem>()
                .FirstOrDefault(item => item.Content.ToString() == _currentOrder.Status);

            PartnerCombo.SelectedValue = _currentOrder.PartnerId;

            OrderProductsGrid.ItemsSource = _currentOrder.ApplicationProducts.ToList();
            CalculateTotal();
        }

        private void CalculateTotal()
        {
            _currentOrder.TotalAmount = _currentOrder.ApplicationProducts
                .Sum(ap => ap.Quantity * ap.UnitPrice);
            TotalAmountLabel.Content = _currentOrder.TotalAmount.ToString(); // Исправленная строка
        }

        private void AddProduct_Click(object sender, RoutedEventArgs e)
        {
            var selectWindow = new SelectProductsWindow();
            if (selectWindow.ShowDialog() == true)
            {
                // Получаем выбранный продукт из БД через текущий контекст
                var selectedProduct = _context.Products.Find(selectWindow.SelectedProduct.Id);

                var orderProduct = new ApplicationProducts
                {
                    ProductId = selectedProduct.Id,
                    Quantity = selectWindow.Quantity,
                    UnitPrice = selectWindow.Price,
                    Products = selectedProduct,
                    Applications = _currentOrder // Устанавливаем связь с заявкой
                };

                // Добавляем в контекст
                _context.ApplicationProducts.Add(orderProduct);

                // Обновляем коллекцию
                _currentOrder.ApplicationProducts.Add(orderProduct);

                // Создаем новый список для принудительного обновления DataGrid
                OrderProductsGrid.ItemsSource = null;
                OrderProductsGrid.ItemsSource = _currentOrder.ApplicationProducts.ToList();

                CalculateTotal();
            }
        }

        private void RemoveProduct_Click(object sender, RoutedEventArgs e)
        {
            if (OrderProductsGrid.SelectedItem is ApplicationProducts selectedProduct)
            {
                // Удаляем из контекста базы данных
                _context.ApplicationProducts.Remove(selectedProduct);

                // Также удаляем из коллекции текущего заказа (для UI)
                _currentOrder.ApplicationProducts.Remove(selectedProduct);

                // Обновляем DataGrid
                OrderProductsGrid.ItemsSource = null;
                OrderProductsGrid.ItemsSource = _currentOrder.ApplicationProducts.ToList();

                CalculateTotal();
            }
        }


        private void SaveOrder_Click(object sender, RoutedEventArgs e)
        {
            if (PartnerCombo.SelectedValue == null)
            {
                MessageBox.Show("Выберите партнера", "Ошибка");
                return;
            }

            _currentOrder.PartnerId = (int)PartnerCombo.SelectedValue;
            _currentOrder.Status = ((ComboBoxItem)StatusCombo.SelectedItem).Content.ToString();

            try
            {
                if (_isNewOrder)
                {
                    _context.Applications.Add(_currentOrder);
                }

                _context.SaveChanges();
                DialogResult = true;

                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения: {ex.Message}", "Ошибка");
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            if (_isNewOrder)
            {
                _context.Applications.Remove(_currentOrder);
            }
            else
            {
                _context.Entry(_currentOrder).State = EntityState.Unchanged;
            }

            DialogResult = false;
            Close();
        }

        private void CalculateMaterials_Click(object sender, RoutedEventArgs e)
        {
            if (_currentOrder.ApplicationProducts == null || !_currentOrder.ApplicationProducts.Any())
            {
                MessageBox.Show("Добавьте продукцию в заявку перед расчетом материалов", "Информация");
                return;
            }

            var calculationWindow = new MaterialCalculationWindow(_currentOrder.Id); // ✅ передаём orderId
            calculationWindow.Owner = this;
            calculationWindow.ShowDialog();
        }

    }
}