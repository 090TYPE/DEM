using System;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using PartnerOrderSystem.DataBase;
using System.Windows.Controls;
using Applications = PartnerOrderSystem.DataBase.Applications;

namespace PartnerOrderSystem
{
    public partial class OrdersWindow : Window
    {
        private var3Entities _context = new var3Entities();

        public OrdersWindow()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            _context.Partners.Load();
            PartnerFilter.ItemsSource = _context.Partners.Local;

            _context.Applications.Load();
            OrdersGrid.ItemsSource = _context.Applications.Local;
        }

        // Добавляем пустой обработчик, который объявлен в XAML
        private void OrdersGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // Можно добавить логику при необходимости
        }

        private void BackToPartners_Click(object sender, RoutedEventArgs e)
        {
            var mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void FilterButton_Click(object sender, RoutedEventArgs e)
        {
            var query = _context.Applications.AsQueryable();

            if (PartnerFilter.SelectedValue != null)
                query = query.Where(a => a.PartnerId == (int)PartnerFilter.SelectedValue);

            if (DateFromFilter.SelectedDate != null)
                query = query.Where(a => a.ApplicationDate >= DateFromFilter.SelectedDate);

            if (DateToFilter.SelectedDate != null)
                query = query.Where(a => a.ApplicationDate <= DateToFilter.SelectedDate);

            if (StatusFilter.SelectedIndex > 0)
                query = query.Where(a => a.Status == ((ComboBoxItem)StatusFilter.SelectedItem).Content.ToString());

            OrdersGrid.ItemsSource = query.ToList();
        }

        private void AddOrder_Click(object sender, RoutedEventArgs e)
        {
            var editWindow = new EditOrderWindow();
            if (editWindow.ShowDialog() == true)
            {
                _context.SaveChanges();
                LoadData();
            }
        }

        private void EditOrder_Click(object sender, RoutedEventArgs e)
        {
            if (OrdersGrid.SelectedItem is Applications selectedOrder)
            {
                var editWindow = new EditOrderWindow(selectedOrder.Id)
                {
                    Owner = this
                };

                bool? result = editWindow.ShowDialog();

                if (result == true)
                {
                    // После успешного сохранения обновляем список заявок
                    LoadOrders();
                }
            }
            else
            {
                MessageBox.Show("Выберите заявку для редактирования");
            }
        }


        private void DeleteOrder_Click(object sender, RoutedEventArgs e)
        {
            if (OrdersGrid.SelectedItem is Applications selectedOrder)
            {
                if (MessageBox.Show("Удалить выбранную заявку?", "Подтверждение",
                    MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    // Загрузка связанных продуктов для заявки
                    var relatedProducts = _context.ApplicationProducts.Where(ap => ap.ApplicationId == selectedOrder.Id);

                    // Удаляем сначала связанные записи
                    _context.ApplicationProducts.RemoveRange(relatedProducts);

                    // Удаляем заявку
                    _context.Applications.Remove(selectedOrder);

                    _context.SaveChanges();
                    LoadData();
                }
            }
        }


        private void ShowProducts_Click(object sender, RoutedEventArgs e)
        {
            if (OrdersGrid.SelectedItem is Applications selectedOrder)
            {
                var productsWindow = new OrderProductsWindow(selectedOrder.Id);
                productsWindow.ShowDialog();
            }
        }

        private void LoadOrders()
        {
            _context = new var3Entities(); // Создаём новый контекст, чтобы не использовать кеш
            _context.Partners.Load();
            var orders = _context.Applications.Include(a => a.Partners).ToList();
            OrdersGrid.ItemsSource = orders;
        }


        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            // Заполнить фильтры партнерами, статусами и загрузить заявки
            _context.Partners.Load();
            PartnerFilter.ItemsSource = _context.Partners.Local;
            PartnerFilter.SelectedIndex = -1;

            StatusFilter.SelectedIndex = 0; // Выбираем "Все"

            LoadOrders();
        }
    }
}