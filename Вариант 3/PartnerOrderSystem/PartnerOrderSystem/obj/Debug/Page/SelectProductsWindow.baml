   M S B A M L   `   `   `  ����  PartnerOrderSystem-    'PartnerOrderSystem.SelectProductsWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$#  Выбор продукции��5   	   $	��500��6!   $	��700��6.   ���#FFFFFF$%��Bahnschrift Light SemiCondensed)�5   	   .��5      � $��10q�6    � RowDefinitions 5	   
   �� 5
      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $#��Выбор продукции��6!   $��24(�68   $
��Bold"�6F   ���#0C4882$��0 0 0 10q�6m   �� 5   
   $��0��6    �� Orientation$ 
Horizontal=�6"   $��	0 40 0 10q�6;   $
��Left=�6N   .+�5      �� -   5         ��Name$ 	SearchBox��5      $	��250��6)   $��28��65   $��0 0 10 0q�6A   $��14(�5      $��4q�6$   �� 5      -   5        $��
Поиск��5      $	��100��6%   $��28��61   ���#0C4882
�������6e   5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ ProductsGrid��5      $��1��6)      AutoGenerateColumns .     SelectionMode$ Single=�5      ���#FFFFFF$%��Bahnschrift Light SemiCondensed)�5       
���   �$��0q�5"         CanUserAddRows .     
IsReadOnly . 	   	RowHeight$	 30Q�5%      
   GridLinesVisibility$
 
Horizontal=�5&         Columns 5'      0  *System.Windows.Controls.DataGridTextColumn  5(      ,  &System.Windows.Controls.DataGridColumn   Header$ Артикул��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 120 6R   1  +System.Windows.Controls.DataGridBoundColumn   Binding 66   �� *	Article+6R     5)      $ Наименование��6%   $ * 6T    6;   �� *Name+6T     5*      $ Цена��6%   $	 120 6n    63   �� *MinPartnerPrice+ �� StringFormat$ {0:N2}��6n   5,      �� 5/   
   $��2��6   $ 
Horizontal=�6"   ���#BBDCFA$��0 10 0 0q�6Q   $��Center=�6c   .+�50      �� $��Количество:��6   $��90��6*   ���#0C4882$��Center=�6J   �� 51      -   5        $ QuantityBox��51      $	��100��6+   $��28��67   $��1��6C   $��14(�6L   $��4q�6Z   �� 53      $��	Цена:��6   $��90��6$   $��20 0 0 0q�6/   ���#0C4882$��Center=�6V   �� 54      -   5        $ PriceBox��54      $	��100��6(   $��28��64   $��14(�6@   $��4q�6N   �� 56      -   5        $��Добавить��56      $	��120��6(   $��28��64   $��20 0 0 0q�6@   ���#0C4882
�������57   =   58      59      5:      