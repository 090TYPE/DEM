   M S B A M L   `   `   `  ����   PartnerOrderSystem.    (PartnerOrderSystem.ApplicationViewWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$#  Просмотр заявки��$	��450��$	��800��$%��Bahnschrift Light SemiCondensed)�.��� $��10q� � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+���  �� Orientation$ Vertical=�$��0��$��0 0 0 10q�.+��� $��Данные заявки��$��20(�$
��Bold"����#0C4882$��0 0 0 10q��� $ 
Horizontal=�$��0 0 0 5q�.+��� $��Партнёр:��$	��100��$
��Bold"��� -    ��Name$ PartnerNameText���� $ 
Horizontal=�$��0 0 0 5q�.+��� $��	Дата:��$	��100��$
��Bold"��� -   $ ApplicationDateText���� $ 
Horizontal=�$��0 0 0 5q�.+��� $��Статус:��$	��100��$
��Bold"��� -   $ 
StatusText���� $ 
Horizontal=�$��0 0 0 5q�.+��� $��Сумма:��$	��100��$
��Bold"��� -   $ TotalAmountText��&   System.Windows.Controls.DataGrid  -     Name$ ProductsGrid��$��1��   AutoGenerateColumns .     
IsReadOnly .    CanUserAddRows .  $%��Bahnschrift Light SemiCondensed)�
���   �$��0 0 0 10q�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn	   Header$	 Продукт��
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Product.Name+  $	 Артикул��$	
 100  �� *Product.Article+  $	 Количество��$	
 100  �� *
Quantity+  $	 Цена за ед.��$	
 100  �� *	UnitPrice+ �� StringFormat$ C��  $'	 !Дата производства��$	
 150  �� *ProductionDate+$ d���� $��2��$ 
Horizontal=�$��Right=�.+��� -   $��Закрыть��$	��100�����#0C4882
��������� -   $3��-Редактировать продукцию��$	��180��$��10 0 0 0q����#0C4882
�������