using DEM5.Model;
using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace DEM5
{
	public partial class AddEditSupplierWindow : Window
	{
		private DEM5Entities _context = new DEM5Entities();
		private Suppliers _currentSupplier;
		public event Action SupplierChanged;
		public AddEditSupplierWindow()
		{

			InitializeComponent();
			LoadSuppliers();

			// Инициализируем текущего поставщика новым объектом по умолчанию
			_currentSupplier = new Suppliers();

			// Очищаем поля, чтобы пользователь мог сразу ввести нового поставщика
			ClearInputFields();
		}

		private void LoadSuppliers()
		{
			var suppliers = _context.Suppliers.ToList();
			SupplierComboBox.ItemsSource = suppliers;
			SupplierComboBox.DisplayMemberPath = "CompanyName";
			SupplierComboBox.SelectedValuePath = "SupplierID";
		}

		private void SupplierComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
			if (SupplierComboBox.SelectedItem is Suppliers selected)
			{
				_currentSupplier = selected;
				SupplierTypeTextBox.Text = selected.SupplierType;
				CompanyNameTextBox.Text = selected.CompanyName;
				INNTextBox.Text = selected.INN;
			}
			else
			{
				// Если ничего не выбрано - очищаем поля и создаём новый объект
				_currentSupplier = new Suppliers();
				ClearInputFields();
			}
		}

		private void AddNewSupplier_Click(object sender, RoutedEventArgs e)
		{
			_currentSupplier = new Suppliers();
			SupplierComboBox.SelectedItem = null;
			ClearInputFields();
		}

		private void ClearInputFields()
		{
			SupplierTypeTextBox.Text = "";
			CompanyNameTextBox.Text = "";
			INNTextBox.Text = "";
		}

		private void SaveSupplier_Click(object sender, RoutedEventArgs e)
		{
			if (_currentSupplier == null)
			{
				MessageBox.Show("Ошибка: поставщик не выбран и не создан.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (string.IsNullOrWhiteSpace(CompanyNameTextBox.Text))
			{
				MessageBox.Show("Пожалуйста, заполните название компании.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			try
			{
				_currentSupplier.SupplierType = SupplierTypeTextBox.Text;
				_currentSupplier.CompanyName = CompanyNameTextBox.Text;
				_currentSupplier.INN = INNTextBox.Text;

				if (_currentSupplier.SupplierID == 0)
				{
					// Новый поставщик
					_context.Suppliers.Add(_currentSupplier);
				}
				else
				{
					// Существующий поставщик - обновляем
					var supplierToUpdate = _context.Suppliers.Find(_currentSupplier.SupplierID);
					if (supplierToUpdate != null)
					{
						supplierToUpdate.SupplierType = _currentSupplier.SupplierType;
						supplierToUpdate.CompanyName = _currentSupplier.CompanyName;
						supplierToUpdate.INN = _currentSupplier.INN;
					}
				}

				_context.SaveChanges();

				SupplierChanged?.Invoke(); // вызываем событие после сохранения

				MessageBox.Show("Поставщик успешно сохранён.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);

				LoadSuppliers();

				SupplierComboBox.SelectedItem = _context.Suppliers.Find(_currentSupplier.SupplierID);
			}
			catch (Exception ex)
			{
				MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}
		private void BackButton_Click(object sender, RoutedEventArgs e)
		{
			this.Close();
		}
	}
}