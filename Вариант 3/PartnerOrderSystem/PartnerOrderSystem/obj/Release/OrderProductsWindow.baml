   M S B A M L   `   `   `  ����   PartnerOrderSystem,    &PartnerOrderSystem.OrderProductsWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$(  "Продукция в заявке��$	��450��$	��600��.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0�� �� Orientation$ Vertical=�.+��� -    ��Name$ OrderInfoText��$��16(�$
��Bold"��� -   $ PartnerInfoText��$��0,5,0,0q��� -   $ StatusInfoText���� -   $ TotalInfoText��$
��Bold"�$��0,5,0,0q�&   System.Windows.Controls.DataGrid  -     Name$ ProductsGrid��$��2��   AutoGenerateColumns .  $
��0,10q�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Продукт��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 �� *Products.Name+  $ Количество��$	 100 	 �� *
Quantity+  $ Цена��$	 100 	 �� *	UnitPrice+
 �� StringFormat$
 {0:N2}��  $ 
Сумма��$	 100 	 �� *	LineTotal+$
 {0:N2}���� -   $��3��$��Закрыть��$	��100��$��Right=�$��0,10,0,0q�