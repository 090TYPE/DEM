   M S B A M L   `   `   `  ����   PartnerOrderSystem6    0PartnerOrderSystem.ApplicationProductsEditWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$E  ?Редактирование продукции в заявке��$	��500��$	��700��$%��Bahnschrift Light SemiCondensed)�.��� $��10q� � RowDefinitions �� $��* ��� $
��Auto �.+�&   System.Windows.Controls.DataGrid  -     Name$ AppProductsGrid��$��0��   AutoGenerateColumns .     CanUserAddRows .    CanUserDeleteRows . $%��Bahnschrift Light SemiCondensed)�
���   �$��0 0 0 10q�   Columns 4  .System.Windows.Controls.DataGridComboBoxColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Продукт��   SelectedValuePath$ Id��	   DisplayMemberPath$
	 Name��
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 *    SelectedValueBinding �� *	ProductId+ �� Mode$ TwoWay=�   ItemsSource �� *ProductsList+0  *System.Windows.Controls.DataGridTextColumn  $ Количество��$	
 100 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *
Quantity+$ TwoWay=�  $ Цена за ед.��$	
 100  �� *	UnitPrice+$ TwoWay=� �� StringFormat$ C��  $' !Дата производства��$	
 150  �� *ProductionDate+$ TwoWay=�$ d���� $��1�� �� Orientation$ 
Horizontal=�$��Right=�.+��� -   $��Сохранить��$	��100��$��5q����#0C4882
��������� -   $��Отмена��$	��100��$��5q����#0C4882
�������