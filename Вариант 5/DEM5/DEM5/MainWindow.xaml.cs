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
using System.Windows.Media.Media3D;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DEM5
{
	/// <summary>
	/// Логика взаимодействия для MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		private DEM5Entities db = new DEM5Entities();

		public MainWindow()
		{
			InitializeComponent();
			LoadMaterials();
		}
		private void OpenCalculationWindow_Click(object sender, RoutedEventArgs e)
		{
			var calculationWindow = new MaterialCalculationWindow();
			calculationWindow.Owner = this;
			calculationWindow.ShowDialog();
		}
		private void LoadMaterials()
		{
			using (var context = new DEM5Entities())
			{
				var materials = context.Materials.Include("MaterialTypes").Include("Suppliers").ToList();
				MaterialsGrid.ItemsSource = materials;
			}
		}

		private void AddMaterial_Click(object sender, RoutedEventArgs e)
		{
			var addWindow = new AddEditMaterialWindow();
			if (addWindow.ShowDialog() == true)
			{
				LoadMaterials(); // Метод, который перезагружает данные в DataGrid
			}
		}

		private void EditMaterial_Click(object sender, RoutedEventArgs e)
		{
			if (MaterialsGrid.SelectedItem is Materials selectedMaterial)
			{
				var editWindow = new AddEditMaterialWindow(selectedMaterial);
				if (editWindow.ShowDialog() == true)
				{
					LoadMaterials(); // Обновляем данные
				}
			}
			else
			{
				MessageBox.Show("Выберите материал для редактирования.", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
			}
		}
		
		private void ShowProducts_Click(object sender, RoutedEventArgs e)
		{
			if (MaterialsGrid.SelectedItem is Materials selected)
			{
				var window = new ProductsWindow(selected.MaterialID);
				window.ShowDialog();
			}
			else
			{
				MessageBox.Show("Выберите материал для просмотра продукции.", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
			}
		}
	}
}
