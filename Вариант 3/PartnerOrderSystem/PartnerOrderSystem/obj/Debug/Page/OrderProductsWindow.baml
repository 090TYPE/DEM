   M S B A M L   `   `   `  ����  PartnerOrderSystem,    &PartnerOrderSystem.OrderProductsWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$(  "Продукция в заявке��5   	   $	��450��5   	   $	��600��6   ���#FFFFFF$%��Bahnschrift Light SemiCondensed)�5   	   .��5      � $��10q�6    � RowDefinitions 5	   
   �� 5
      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6    �� Orientation$ Vertical=�6"   $��0,0,0,10q�69   .+�5      �� -   5         ��Name$ OrderInfoText��5      $��16(�6/   $
��Bold"�6=   ���#0C48826O   �� 5      -   5        $ PartnerInfoText��5      $��0,5,0,0q�61   ���#0C48826B   �� 5      -   5        $ StatusInfoText��5      ���#0C488260   �� 5      -   5        $ TotalInfoText��5      $
��Bold"�6/   $��0,5,0,0q�6A   ���#0C48826R   5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ ProductsGrid��5      $��1��6)      AutoGenerateColumns .  $��0,0,0,10q�6R   ���#FFFFFF
���   �   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Продукт��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6X   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 66   �� *Products.Name+6X     5      $ Количество��6%   $	 100 6V   	 69   �� *
Quantity+6V     5      $ Цена��6%   $	 100 6h   	 63   �� *	UnitPrice+
 �� StringFormat$
 {0:N2}��6h     5      $ 
Сумма��6%   $	 100 6i   	 64   �� *	LineTotal+$
 {0:N2}��6i   5      �� 5    
   -   5        $��2��5       $��Закрыть��6   $	��100��60   $��Right=�6<   ���#0C4882
�������$��6q�5!   9   5"      5#      