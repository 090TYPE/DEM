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
	/// <summary>
	/// Логика взаимодействия для ProductsWindow.xaml
	/// </summary>
	public partial class ProductsWindow : Window
	{
		private DEM5Entities db = new DEM5Entities();

		public ProductsWindow(int materialId)
		{
			InitializeComponent();
			LoadProductsUsingMaterial(materialId);
		}
		private void BackButton_Click(object sender, RoutedEventArgs e)
		{
			this.Close(); // Возврат к предыдущему открытому окну
		}
		private void LoadProductsUsingMaterial(int materialId)
		{
			using (var context = new DEM5Entities())
			{
				var products = context.ProductMaterials
					.Where(pm => pm.MaterialID == materialId)
					.Select(pm => new
					{
						ProductName = pm.Products.ProductName,
						RequiredQuantity = pm.Quantity
					})
					.ToList();

				ProductsGrid.ItemsSource = products;
			}
		}
	}
}
