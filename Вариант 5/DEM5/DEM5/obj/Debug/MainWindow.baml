   M S B A M L   `   `   `  ����?  ;DEM5, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:DEM5DEM5  5   	       DEM5.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   $localclr-namespace:DEM5     5   	     � Icon$  Resources/app_icon.ico��5   	    � Title$ 
MainWindow��5	   	   $	��450��6   $	��800��6)   .��5
      � $��10q�6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��Resources/logo.png��6   $��Uniform=�6,   $
��Left=�6>   $��10,10,0,291q�6Y   $	��228��6n   &   System.Windows.Controls.DataGrid  5   
   -   5        $��MaterialsGrid��5         AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�6V   $��
0,102,10,0q�6m   $	��239��6�   $	��Top=�6�      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ 40 6P   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 61   �� *
MaterialID+6P     5      $ Название��6%   $ * 6X   	 67   �� *MaterialName+6X     5      $ Поставщик��6%   $ * 6b   	 68   �� *Suppliers.CompanyName+6b     5      $ В наличии��6%   $ 80 6\   	 68   �� *QuantityInStock+6\     5      $ Ед. измерения��6%   $	 100 6U   	 6<   �� *Unit+6U     5      $ Цена��6%   $ 80 6L   	 63   �� *Cost+6L   5      �� 5   
   
 �� Orientation$
 
Horizontal=�6   $��Center=�6.   $��	0,359,0,0q�6K   $��2��6^   .+�5      �� -   5        $��5q�5      $	��115��6    .��5      �� $'��!Добавить материал��6   $
��Wrap=�65    �� TextAlignment$ Center=�6I   5      �� 5       -   5        $��5q�5       $	��128��6    .��5!      �� $1��+Редактировать материал��6   $
��Wrap=�6:   $ Center=�6N   5"      �� 5%      -   5        $��5q�5%      $	��100��6    .��5&      �� $��Продукция��6   $
��Wrap=�6-   $ Center=�6A   5'      �� 5)      -   5        $��5q�5)      $	��105��6    .��5*      �� $%��Расчёт материала��6   $
��Wrap=�64   $ Center=�6H   5+      5,      5-      5.      