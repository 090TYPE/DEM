   M S B A M L   `   `   `  ����   PartnerOrderSystem(    "PartnerOrderSystem.EditOrderWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$/  )Редактирование заявки��$	��500��$	��800�����#FFFFFF$%��Bahnschrift Light SemiCondensed)�.��� $��10q� � RowDefinitions �� $
��Auto ��� $��10 ��� $��* ��� $
��Auto ��� $
��Auto �.+��� $��0�� �� Orientation$ 
Horizontal=�$��Center=�.+��� $��Партнер:��$��80�����#0C4882$
��Bold"�$��Center=��� -    ��Name$ PartnerCombo��$	��300�� �� DisplayMemberPath$
 Name�� �� SelectedValuePath$ Id���� $��Статус:��$��80��$��10,0,0,0q����#0C4882$
��Bold"�$��Center=��� -   $ StatusCombo��$	��120��.@��� $��
Новая���� $��В обработке���� $��Завершена��&   System.Windows.Controls.DataGrid  -     Name$ OrderProductsGrid��$��2��   AutoGenerateColumns .     CanUserAddRows .  $��	0,10,0,10q����#FFFFFF$%��Bahnschrift Light SemiCondensed)�
���   �	   SelectionMode$	 Single=�
   
IsReadOnly
 .     Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Продукт��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *    
IsReadOnly . 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Products.Name+  $ Количество��$	 100  �� *
Quantity+  $ Цена��$	 100  �� *	UnitPrice+ �� StringFormat$ {0:N2}��  $ 
Сумма��$	 100  .  �� *	LineTotal+$ {0:N2}��4  .System.Windows.Controls.DataGridTemplateColumn  $	 100    CellTemplate �� .R��� -   $��Удалить�����#0C4882
�������$	��4,2q�$	��2,0q��� $��3��$ 
Horizontal=�$��Right=�$��0,0,0,10q�.+��� $��Итого:��$
��Bold"����#0C4882$��14(��� -    ��Name$ TotalAmountLabel��$
��0.00��$
��Bold"�$	��100��$��14(��� $��4��$ 
Horizontal=�$��Right=�.+��� -   $)��#Добавить продукцию��$	��150��$��0,0,10,0q����#0C4882
��������� -   $-��'Рассчитать материалы��$	��150��$��0,0,10,0q����#0C4882
��������� -   $��Сохранить��$	��100��$��0,0,10,0q����#0C4882
��������� -	   $��Отмена��$	��100�����#0C4882
�������