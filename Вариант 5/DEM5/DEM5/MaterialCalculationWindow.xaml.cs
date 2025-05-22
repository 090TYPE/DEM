using DEM5.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
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
using System.Windows.Media.Media3D;
using System.Windows.Shapes;

namespace DEM5
{
	/// <summary>
	/// Логика взаимодействия для MaterialCalculationWindow.xaml
	/// </summary>
	public partial class MaterialCalculationWindow : Window
	{
		private DEM5Entities db = new DEM5Entities();

		
		private void BackButton_Click(object sender, RoutedEventArgs e)
		{
			this.Close(); // Возврат к предыдущему открытому окну
		}

		public MaterialCalculationWindow()
		{
			InitializeComponent();

			//MaterialsComboBox.ItemsSource = db.Materials.Include(m => m.MaterialTypes).ToList();
			//ProductsComboBox.ItemsSource = db.Products.Include(p => p.ProductType).ToList();
		}
		private void CalculateButton_Click(object sender, RoutedEventArgs e)
		{
			//if (!double.TryParse(Param1TextBox.Text, out double param1) ||
			//	!double.TryParse(Param2TextBox.Text, out double param2) ||
			//	!int.TryParse(MaterialAmountTextBox.Text, out int materialAmount))
			//{
			//	MessageBox.Show("Введите корректные параметры и количество материала.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
			//	return;
			//}

			//var selectedMaterial = MaterialsComboBox.SelectedItem as Material;
			//if (selectedMaterial == null)
			//{
			//	MessageBox.Show("Выберите материал.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
			//	return;
			//}

			//var selectedProduct = ProductsComboBox.SelectedItem as Products;
			//if (selectedProduct == null)
			//{
			//	MessageBox.Show("Выберите продукт.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
			//	return;
			//}

			//int materialTypeId = selectedMaterial.MaterialTypeID;
			//int productTypeId = selectedProduct.ProductID;

			//int outputCount = CalculateProductOutput(productTypeId, materialTypeId, materialAmount, param1, param2);

			//if (outputCount == -1)
			//{
			//	ResultTextBlock.Text = "Ошибка в расчетах — проверьте входные данные.";
			//}
			//else
			//{
			//	ResultTextBlock.Text = $"Можно произвести {outputCount} ед. продукции из {materialAmount} ед. материала.";
			//}
		}


		//public int CalculateProductOutput(int productTypeId, int materialTypeId, int materialAmount, double param1, double param2)
		//{
		//	//if (materialAmount <= 0 || param1 <= 0 || param2 <= 0)
		//	//	return -1;

		//	//var productType = db.Products.FirstOrDefault(pt => pt.ProductID == productTypeId);
		//	//var materialType = db.MaterialTypes.FirstOrDefault(mt => mt.MaterialTypeID == materialTypeId);

		//	//if (productType == null || materialType == null)
		//	//	return -1;

		//	//// Расчет необходимого количества материала на одну единицу продукции
		//	//double baseMaterialNeed = param1 * param2 * productType.Coefficient;

		//	//// Учет потерь материала
		//	//double lossPercentage = (double)materialType.LossPercentage;
		//	//double effectiveMaterial = materialAmount * (1 - lossPercentage / 100.0);

		//	//if (baseMaterialNeed == 0)
		//	//	return -1;

		//	//int producibleUnits = (int)(effectiveMaterial / baseMaterialNeed);

		//	//return producibleUnits;
		//}
	}
}
