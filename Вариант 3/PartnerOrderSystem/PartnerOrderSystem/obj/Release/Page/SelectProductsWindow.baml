   M S B A M L   `   `   `  ����   PartnerOrderSystem-    'PartnerOrderSystem.SelectProductsWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$#  Выбор продукции��$	��500��$	��700�����#FFFFFF$%��Bahnschrift Light SemiCondensed)�.��� $��10q� � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��$#��Выбор продукции��$��24(�$
��Bold"����#0C4882$��0 0 0 10q��� $��0�� �� Orientation$ 
Horizontal=�$��	0 40 0 10q�$
��Left=�.+��� -    ��Name$ 	SearchBox��$	��250��$��28��$��0 0 10 0q�$��14(�$��4q��� -   $��
Поиск��$	��100��$��28�����#0C4882
�������&   System.Windows.Controls.DataGrid  -     Name$ ProductsGrid��$��1��   AutoGenerateColumns .     SelectionMode$ Single=����#FFFFFF$%��Bahnschrift Light SemiCondensed)�
���   �$��0q�   CanUserAddRows .     
IsReadOnly . 	   	RowHeight$	 30Q�
   GridLinesVisibility$
 
Horizontal=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Артикул��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 120 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *	Article+  $ Наименование��$ *  �� *Name+  $ Цена��$	 120  �� *MinPartnerPrice+ �� StringFormat$ {0:N2}���� $��2��$ 
Horizontal=����#BBDCFA$��0 10 0 0q�$��Center=�.+��� $��Количество:��$��90�����#0C4882$��Center=��� -   $ QuantityBox��$	��100��$��28��$��1��$��14(�$��4q��� $��	Цена:��$��90��$��20 0 0 0q����#0C4882$��Center=��� -   $ PriceBox��$	��100��$��28��$��14(�$��4q��� -   $��Добавить��$	��120��$��28��$��20 0 0 0q����#0C4882
�������