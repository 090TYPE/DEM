   M S B A M L   `   `   `  ����   PartnerOrderSystem%    PartnerOrderSystem.OrdersWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$+  %Управление заявками��$	��600��$
��1000��.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0�� �� Orientation$ 
Horizontal=�.+��� -   $&�� Назад к партнерам��$��0,0,10,0q��� $+��%Управление заявками��$��20(�$
��Bold"��� $��1��$ 
Horizontal=�$
��0,10q�.+��� -    ��Name$ PartnerFilter��$	��200�� �� DisplayMemberPath$
 Name�� �� SelectedValuePath$ Id��$��0,0,10,0q�(  "System.Windows.Controls.DatePicker  -     Name$ DateFromFilter��$	��120��$��0,0,10,0q�  -   $ DateToFilter��$	��120��$��0,0,10,0q��� -   $ StatusFilter��$	��120��$��0,0,10,0q�.@��� $��Все���� $��
Новая���� $��В обработке���� $��Завершена���� -   $��Фильтровать��&   System.Windows.Controls.DataGrid  -     Name$ 
OrdersGrid��$��2��   AutoGenerateColumns .  	   SelectionMode$	 Single=�
   Columns
 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ 
Номер��   Width5  /System.Windows.Controls.DataGridLengthConverter$ 50 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $ Партнер��$	 200  �� *Partners.Name+  $ Дата��$	 100  �� *ApplicationDate+ �� StringFormat$ {0:dd.MM.yyyy}��  $ Статус��$	 120  �� *Status+  $ 
Сумма��$	 100  �� *TotalAmount+$ {0:N2}���� $��3��$ 
Horizontal=�$��Right=�$
��0,10q�.+��� -   $��Добавить��$	��100��$��0,0,10,0q��� -	   $ ��Редактировать��$	��100��$��0,0,10,0q��� -
   $��Удалить��$	��100��$��0,0,10,0q��� -   $��Продукция��$	��100��