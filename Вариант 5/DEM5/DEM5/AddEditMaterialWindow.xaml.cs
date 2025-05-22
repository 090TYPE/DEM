using DEM5.Model;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace DEM5
{
	public partial class AddEditMaterialWindow : Window
	{
		private Materials _currentMaterial;

		public AddEditMaterialWindow(Materials selectedMaterial = null)
		{
			InitializeComponent();
			_currentMaterial = selectedMaterial ?? new Materials();
			LoadMaterialTypes();
			LoadSuppliers();

			// Заполняем поля
			MaterialNameTextBox.Text = _currentMaterial.MaterialName;
			CostTextBox.Text = _currentMaterial.Cost?.ToString();
			UnitTextBox.Text = _currentMaterial.Unit;
			QuantityPerPackageTextBox.Text = _currentMaterial.QuantityPerPackage?.ToString();
			QuantityInStockTextBox.Text = _currentMaterial.QuantityInStock?.ToString();
			MinQuantityTextBox.Text = _currentMaterial.MinQuantity?.ToString();

			if (_currentMaterial.SupplierID != null)
				SupplierComboBox.SelectedValue = _currentMaterial.SupplierID;

			if (_currentMaterial.MaterialTypeID != null)
				MaterialTypeComboBox.SelectedValue = _currentMaterial.MaterialTypeID;
		}

		private void LoadMaterialTypes()
		{
			using (var context = new DEM5Entities())
			{
				var types = context.MaterialTypes.ToList();
				MaterialTypeComboBox.ItemsSource = types;
				MaterialTypeComboBox.DisplayMemberPath = "TypeName";
				MaterialTypeComboBox.SelectedValuePath = "MaterialTypeID";
			}
		}

		private void LoadSuppliers()
		{
			using (var context = new DEM5Entities())
			{
				var suppliers = context.Suppliers.ToList();
				SupplierComboBox.ItemsSource = suppliers;
				SupplierComboBox.DisplayMemberPath = "CompanyName";
				SupplierComboBox.SelectedValuePath = "SupplierID";
			}
		}

		private void AddSupplierButton_Click(object sender, RoutedEventArgs e)
		{
			var addSupplierWindow = new AddEditSupplierWindow();
			addSupplierWindow.SupplierChanged += LoadSuppliers;
			addSupplierWindow.ShowDialog();
		}

		private void BackButton_Click(object sender, RoutedEventArgs e)
		{
			this.Close();
		}

		private void SaveMaterial_Click(object sender, RoutedEventArgs e)
		{
			// Валидация
			if (string.IsNullOrWhiteSpace(MaterialNameTextBox.Text) || MaterialTypeComboBox.SelectedItem == null)
			{
				MessageBox.Show("Пожалуйста, заполните обязательные поля: наименование и тип материала.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (!decimal.TryParse(CostTextBox.Text, out decimal cost) || cost < 0)
			{
				MessageBox.Show("Цена должна быть числом больше или равным 0.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (!int.TryParse(MinQuantityTextBox.Text, out int minQty) || minQty < 0)
			{
				MessageBox.Show("Минимальное количество должно быть положительным числом.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			if (SupplierComboBox.SelectedValue == null || MaterialTypeComboBox.SelectedValue == null)
			{
				MessageBox.Show("Пожалуйста, выберите поставщика и тип материала.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
				return;
			}

			try
			{
				using (var context = new DEM5Entities())
				{
					Materials materialToSave;

					if (_currentMaterial.MaterialID == 0)
					{
						materialToSave = new Materials();
						context.Materials.Add(materialToSave);
					}
					else
					{
						materialToSave = context.Materials.FirstOrDefault(m => m.MaterialID == _currentMaterial.MaterialID);
						if (materialToSave == null)
						{
							MessageBox.Show("Материал не найден в базе данных.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
							return;
						}
					}

					// Заполнение полей
					materialToSave.MaterialName = MaterialNameTextBox.Text;
					materialToSave.Cost = cost;
					materialToSave.Unit = UnitTextBox.Text;
					materialToSave.QuantityPerPackage = int.TryParse(QuantityPerPackageTextBox.Text, out int qpp) ? (int?)qpp : null;
					materialToSave.QuantityInStock = int.TryParse(QuantityInStockTextBox.Text, out int qis) ? (int?)qis : null;
					materialToSave.MinQuantity = minQty;
					materialToSave.SupplierID = (int)SupplierComboBox.SelectedValue;
					materialToSave.MaterialTypeID = (int)MaterialTypeComboBox.SelectedValue;

					context.SaveChanges();

					MessageBox.Show("Материал успешно сохранён.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
					this.DialogResult = true;
				}
			}
			catch (Exception ex)
			{
				MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
			}
		}
	}
}
