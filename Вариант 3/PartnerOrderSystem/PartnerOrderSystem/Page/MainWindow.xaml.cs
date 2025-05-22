using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using PartnerOrderSystem.DataBase;

namespace PartnerOrderSystem
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private var3Entities _context = new var3Entities();
        private byte[] _logoData = null;
        private Partners _editingPartner = null;

        public MainWindow()
        {
            InitializeComponent();
            LoadPartnerTypes();
            LoadData();
            _context = new var3Entities();
        }

        private void LoadData()
        {
            PartnersGrid.ItemsSource = _context.Partners.ToList();
            ClearFields();
        }

        private void LoadPartnerTypes()
        {
            PartnerTypeComboBox.ItemsSource = _context.PartnerTypes.ToList();
        }

        private void ClearFields()
        {
            _editingPartner = null;
            NameBox.Text = "";
            INNBox.Text = "";
            RatingBox.Text = "";
            DirectorBox.Text = "";
            AddressBox.Text = "";
            PhoneBox.Text = "";
            EmailBox.Text = "";
            _logoData = null;
            LogoImage.Source = null;
        }

        private void PartnersGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (PartnersGrid.SelectedItem is Partners selected)
            {
                _editingPartner = selected;
                NameBox.Text = selected.Name;
                INNBox.Text = selected.INN;
                AddressBox.Text = selected.Address;
                RatingBox.Text = selected.Rating.ToString();
                DirectorBox.Text = selected.DirectorName;
                PhoneBox.Text = selected.Phone;
                EmailBox.Text = selected.Email;
                _logoData = selected.Logo;

                if (_logoData != null)
                {
                    using (var ms = new MemoryStream(_logoData))
                    {
                        BitmapImage image = new BitmapImage();
                        image.BeginInit();
                        image.StreamSource = ms;
                        image.CacheOption = BitmapCacheOption.OnLoad;
                        image.EndInit();
                        LogoImage.Source = image;
                    }
                }
                else
                {
                    LogoImage.Source = null;
                }
            }
        }

        private void ChooseLogo_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new Microsoft.Win32.OpenFileDialog();
            dialog.Filter = "Image files|*.jpg;*.png;*.bmp";

            if (dialog.ShowDialog() == true)
            {
                _logoData = File.ReadAllBytes(dialog.FileName);
                LogoImage.Source = new BitmapImage(new Uri(dialog.FileName));
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            // Простая валидация перед сохранением
            if (string.IsNullOrWhiteSpace(NameBox.Text) ||
                string.IsNullOrWhiteSpace(INNBox.Text) ||
                string.IsNullOrWhiteSpace(RatingBox.Text))
            {
                MessageBox.Show("Пожалуйста, заполните все обязательные поля: Название, ИНН и Рейтинг.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (!int.TryParse(RatingBox.Text, out var rating))
            {
                MessageBox.Show("Рейтинг должен быть целым числом.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            try
            {
                if (_editingPartner == null)
                {
                    _editingPartner = new Partners();
                    _context.Partners.Add(_editingPartner);
                }

                if (PartnerTypeComboBox.SelectedValue == null)
                {
                    MessageBox.Show("Пожалуйста, выберите тип партнёра.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                _editingPartner.PartnerTypeId = (int)PartnerTypeComboBox.SelectedValue;

                _editingPartner.Name = NameBox.Text.Trim();
                _editingPartner.INN = INNBox.Text.Trim();
                _editingPartner.Rating = rating;
                _editingPartner.Address = AddressBox.Text.Trim();
                _editingPartner.DirectorName = DirectorBox.Text.Trim();
                _editingPartner.Phone = PhoneBox.Text.Trim();
                _editingPartner.Email = EmailBox.Text.Trim();
                _editingPartner.Logo = _logoData;

                _context.SaveChanges();
                MessageBox.Show("Партнёр успешно сохранён.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                LoadData();
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException ex)
            {
                StringBuilder sb = new StringBuilder();
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        sb.AppendLine($"Свойство: {validationError.PropertyName} — {validationError.ErrorMessage}");
                    }
                }
                MessageBox.Show(sb.ToString(), "Ошибка валидации данных", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка при сохранении: " + ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (_editingPartner != null)
            {
                if (MessageBox.Show("Удалить выбранного партнёра?", "Подтверждение", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    // Подгружаем из базы по ID
                    var partnerToDelete = _context.Partners.Find(_editingPartner.Id);
                    if (partnerToDelete != null)
                    {
                        _context.Partners.Remove(partnerToDelete);
                        _context.SaveChanges();
                        LoadData();
                    }
                    else
                    {
                        MessageBox.Show("Партнёр не найден в базе.", "Ошибка");
                    }
                }
            }
        }


        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            ClearFields();
        }


        private void OrdersWindow(object sender, RoutedEventArgs e)
        {
            OrdersWindow mainWindowOrders = new OrdersWindow();
            mainWindowOrders.Show();
            this.Close();
        }
    }
}
