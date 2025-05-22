using System.Data.Entity;
using System.Linq;
using System.Windows;
using PartnerOrderSystem.DataBase;

namespace PartnerOrderSystem
{
    public partial class OrderProductsWindow : Window
    {
        private var3Entities _context = new var3Entities();
        private int _orderId;

        public OrderProductsWindow(int orderId)
        {
            InitializeComponent();
            _orderId = orderId;
            LoadData();
        }

        private void LoadData()
        {
            var order = _context.Applications
                .Include(a => a.Partners)
                .Include(a => a.ApplicationProducts)
                .Include(a => a.ApplicationProducts.Select(ap => ap.Products))
                .FirstOrDefault(a => a.Id == _orderId);

            if (order != null)
            {
                OrderInfoText.Text = $"Заявка №{order.Id} от {order.ApplicationDate:dd.MM.yyyy}";
                PartnerInfoText.Text = $"Партнер: {order.Partners.Name}";
                StatusInfoText.Text = $"Статус: {order.Status}";
                TotalInfoText.Text = $"Общая сумма: {order.TotalAmount:N2} руб.";

                // Добавляем вычисляемое свойство LineTotal для отображения в DataGrid
                ProductsGrid.ItemsSource = order.ApplicationProducts.Select(ap => new
                {
                    ap.Products,
                    ap.Quantity,
                    ap.UnitPrice,
                    LineTotal = ap.Quantity * ap.UnitPrice
                }).ToList();
            }
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}