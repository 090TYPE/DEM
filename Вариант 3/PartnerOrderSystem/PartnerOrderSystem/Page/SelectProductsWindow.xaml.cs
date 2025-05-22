using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using PartnerOrderSystem.DataBase;

namespace PartnerOrderSystem
{
    public partial class SelectProductsWindow : Window
    {
        private var3Entities _context = new var3Entities();
        public Products SelectedProduct { get; private set; }

        public int Quantity { get; private set; }
        public decimal Price { get; private set; }

        private int? orderId;
        private bool _isNewOrder;
        private Applications _currentOrder;


        public SelectProductsWindow(int? orderId = null)
        {
            InitializeComponent();
            this.orderId = orderId;

            if (orderId == null)
            {
                _isNewOrder = true;
                _currentOrder = new Applications
                {
                    ApplicationDate = DateTime.Now,
                    Status = "Новая",
                    ApplicationProducts = new List<ApplicationProducts>()
                };
                _context.Applications.Add(_currentOrder);
            }
            else
            {
                _currentOrder = _context.Applications
                    .Include(a => a.ApplicationProducts)
                    .Include(a => a.ApplicationProducts.Select(ap => ap.Products))
                    .FirstOrDefault(a => a.Id == orderId);

                if (_currentOrder.ApplicationProducts == null)
                    _currentOrder.ApplicationProducts = new List<ApplicationProducts>();
            }

            LoadProducts(); // вызов корректной функции
        }


        private void LoadProducts(string searchText = "")
        {
            _context.Products.Load();

            var query = _context.Products.Local.AsQueryable();

            if (!string.IsNullOrWhiteSpace(searchText))
            {
                query = query.Where(p =>
                    p.Name.Contains(searchText) ||
                    p.Article.Contains(searchText));
            }

            ProductsGrid.ItemsSource = query.ToList();
        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            LoadProducts(SearchBox.Text);
        }

        private void ProductsGrid_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            if (ProductsGrid.SelectedItem is Products selected)
            {
                PriceBox.Text = selected.MinPartnerPrice.ToString("N2");
            }
        }

        private void AddToOrder_Click(object sender, RoutedEventArgs e)
        {
            if (ProductsGrid.SelectedItem is Products selected)
            {
                if (!int.TryParse(QuantityBox.Text, out int quantity) || quantity <= 0)
                {
                    MessageBox.Show("Введите корректное количество", "Ошибка");
                    return;
                }

                if (!decimal.TryParse(PriceBox.Text, out decimal price) || price <= 0)
                {
                    MessageBox.Show("Введите корректную цену", "Ошибка");
                    return;
                }

                SelectedProduct = selected;
                Quantity = quantity;
                Price = price;

                DialogResult = true;
                Close();
            }
        }
    }
}