   M S B A M L   `   `   `  ����   PartnerOrderSystem)    #PartnerOrderSystem.MainWindowOrders   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$%  Заявки партнёров��$	��600��$	��900��$%��Bahnschrift Light SemiCondensed)�.��� $��10q� � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+��� $%��Заявки партнёров��$��24(�$
��Bold"����#0C4882$��0 0 0 10q�&   System.Windows.Controls.DataGrid  -     Name$ ApplicationsGrid��$��1��   AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�   CanUserResizeRows .     CanUserResizeColumns . $%��Bahnschrift Light SemiCondensed)�
���   �   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn	   Header$	 ID��
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 50 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $	 Партнёр��$
 *  �� *Partner.Name+  $	 Дата��$	
 120  �� *ApplicationDate+ �� StringFormat$ d��  $	 Статус��$	
 100  �� *Status+  $	 
Сумма��$	
 100  �� *TotalAmount+$ C��  $	 Предоплата��$	
 120  �� *PrepaymentDate+$ d��  $	 Выполнена��$	
 120  �� *CompletionDate+$ d���� $��2�� �� Orientation$ 
Horizontal=�$��Right=�$��0 10 0 0q�.+��� -   $#��Просмотр заявки��$	��140��$��5q����#0C4882
��������� -   $#��Добавить заявку��$	��140��$��5q����#0C4882
��������� -   $��Обновить��$	��100��$��5q����#0C4882
�������