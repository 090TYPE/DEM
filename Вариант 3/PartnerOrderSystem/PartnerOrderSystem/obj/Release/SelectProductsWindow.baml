   M S B A M L   `   `   `  ����   PartnerOrderSystem-    'PartnerOrderSystem.SelectProductsWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$#  Выбор продукции��$	��450��$	��600��.��� $��10q� � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0�� �� Orientation$ 
Horizontal=�$��0,0,0,10q�.+��� -    ��Name$ 	SearchBox��$	��200��$��0,0,10,0q��� -   $��
Поиск��&   System.Windows.Controls.DataGrid  -     Name$ ProductsGrid��$��1��   AutoGenerateColumns .     SelectionMode$ Single=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Артикул��	   Width5  /System.Windows.Controls.DataGridLengthConverter$		 100 1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 �� *	Article+  $ Наименование��$	 * 
 �� *Name+  $ Цена��$		 100 
 �� *MinPartnerPrice+ �� StringFormat$ {0:N2}���� $��2��$ 
Horizontal=�$
��0,10q�.+��� $��Количество:��$��80���� -   $ QuantityBox��$	��100��$��1���� $��	Цена:��$��80��$��10,0,0,0q��� -   $ PriceBox��$	��100���� -   $��Добавить��$	��100��$��10,0,0,0q�