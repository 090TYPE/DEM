   M S B A M L   `   `   `  ����  PartnerOrderSystem(    "PartnerOrderSystem.EditOrderWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$/  )Редактирование заявки��5   	   $	��500��5   	   $	��800��6   ���#FFFFFF$%��Bahnschrift Light SemiCondensed)�5   	   .��5	      � $��10q�6    � RowDefinitions 5
   
   �� 5      $
��Auto �6   �� 5      $��10 �6   �� 5      $��* �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6    �� Orientation$ 
Horizontal=�6"   $��Center=�6;   .+�5      �� $��Партнер:��6   $��80��6'   ���#0C4882$
��Bold"�6G   $��Center=�6Y   �� 5      -   5         ��Name$ PartnerCombo��5      $	��300��6-    �� DisplayMemberPath$
 Name��69    �� SelectedValuePath$ Id��6R   �� 5      $��Статус:��6   $��80��6&   $��10,0,0,0q�61   ���#0C4882$
��Bold"�6X   $��Center=�6j   �� 5      -   5        $ StatusCombo��5      $	��120��6,   .@�5      �� $��
Новая��6   �� 5      $��В обработке��6   �� 5      $��Завершена��6   5       5!      &   System.Windows.Controls.DataGrid  5$   
   -   5          Name$ OrderProductsGrid��5$      $��2��6.      AutoGenerateColumns .     CanUserAddRows .  $��	0,10,0,10q�5%   *   ���#FFFFFF$%��Bahnschrift Light SemiCondensed)�5'      
���   �	   SelectionMode$	 Single=�5)      
   
IsReadOnly
 .     Columns 5+      0  *System.Windows.Controls.DataGridTextColumn  5,      ,  &System.Windows.Controls.DataGridColumn   Header$ Продукт��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6X      
IsReadOnly . 1  +System.Windows.Controls.DataGridBoundColumn   Binding 66   �� *Products.Name+6b     5-      $ Количество��6%   $	 100 6V    69   �� *
Quantity+6V     5.      $ Цена��6%   $	 100 6h    63   �� *	UnitPrice+ �� StringFormat$ {0:N2}��6h     5/      $ 
Сумма��6%   $	 100 6i    .  64   �� *	LineTotal+$ {0:N2}��6u   4  .System.Windows.Controls.DataGridTemplateColumn  50      $	 100 6)      CellTemplate 51      �� 52      .R�53      �� -   5        $��Удалить��53   %   ���#0C4882
�������$	��4,2q�56   %   $	��2,0q�57   %   58   %   59      5;      5=      �� 5@   
   $��3��6   $ 
Horizontal=�6"   $��Right=�6;   $��0,0,0,10q�6W   .+�5A      �� $��Итого:��6   $
��Bold"�6%   ���#0C4882$��14(�6L   �� 5B      -   5         ��Name$ TotalAmountLabel��5B      $
��0.00��6.   $
��Bold"�6=   $	��100��6O   $��14(�6[   5C      �� 5F   
   $��4��6   $ 
Horizontal=�6"   $��Right=�6;   .+�5G      �� -   5        $)��#Добавить продукцию��5G      $	��150��62   $��0,0,10,0q�6>   ���#0C4882
�������5H   =   �� 5I      -   5        $-��'Рассчитать материалы��5I      $	��150��64   $��0,0,10,0q�6@   ���#0C4882
�������5J   =   �� 5K      -   5        $��Сохранить��5K      $	��100��6)   $��0,0,10,0q�65   ���#0C4882
�������5L   =   �� 5M      -	   5        $��Отмена��5M      $	��100��6&   ���#0C4882
�������5N   =   5O      5P      5Q      