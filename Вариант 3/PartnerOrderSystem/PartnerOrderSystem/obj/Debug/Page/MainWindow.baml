   M S B A M L   `   `   `  ����  PartnerOrderSystem#    PartnerOrderSystem.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  Партнёры��5   	   $	��600��5   	   $
��1000��6   ���#FFFFFF$%��Bahnschrift Light SemiCondensed)�5   	   .��5	      � $��10q�6    � RowDefinitions 5
   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   ]� $��0��6   $��0 0 0 10q�6!   ��. .+�5      �� $/��)pack://application:,,,/Resources/logo.png��6   $	��100��5      $	��100��6    $��Uniform=�5      $	��Top=�5      $
��Left=�5      $��0 0 10 0q�5      �� 5      $��Партнёры��6   $��24(�6(   $
��Bold"�66   $��Center=�6H   ���#0C48826c   5      �� 5   
   $��1��6   $
��Auto=�6$   $
��Auto=�6G   $	��200��6l   $	��300��6|   .��5       &   System.Windows.Controls.DataGrid  -   5          Name$ PartnersGrid��5          AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�6[   ���#FFFFFF$%��Bahnschrift Light SemiCondensed)�5#      
���   �$��0q�5%         Columns 5&      0  *System.Windows.Controls.DataGridTextColumn  5'      ,  &System.Windows.Controls.DataGridColumn   Header$ Название��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6T   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 6;   �� *Name+6T     5(      $ Директор��6)   $ * 6\   	 6;   �� *DirectorName+6\     5)      $ ИНН��6)   $	 100 6N   	 66   �� *INN+6N     5*      $ Телефон��6)   $	 100 6T   	 6:   �� *Phone+6T     5+      $ Email��6)   $	 150 6R   	 68   �� *Email+6R     5,      $ Рейтинг��6)   $ 60 6U   	 6:   �� *Rating+6U   5.      5/      �� 52   
   $��2��6   
 �� Orientation$
 Vertical=�6"   ���#BBDCFA$��0q�6N   .+�53      �� $J��DРедактирование / Добавление партнёра��6   $
��Bold"�54      $��16(�6*   $��0 0 0 10q�55      ���#0C488256      �� 58      $
 
Horizontal=�6   $	��0 5q�62   .+�59      �� $��Название:��6   $	��100��6,   ���#0C488268   �� 5:      -   5         ��Name$ NameBox��5:      $	��200��6+   �� 5;      $��ИНН:��6   $��50��6'   $��10 0 0 0q�62   ���#0C48826D   �� 5<      -   5        $ INNBox��5<      $	��120��6*   �� 5=      $��Рейтинг:��6   $��60��6+   $��10 0 0 0q�66   ���#0C48826H   �� 5>      -   5        $ 	RatingBox��5>      $��50��6-   5?      �� 5A      $
 
Horizontal=�6   $	��0 5q�62   .+�5B      �� $��Директор:��6   $	��100��6,   ���#0C488268   �� 5C      -   5        $ DirectorBox��5C      $	��200��6/   �� 5D      $��Телефон:��6   $��60��6+   $��10 0 0 0q�66   ���#0C48826H   �� 5E      -   5        $ PhoneBox��5E      $	��120��6,   �� 5F      $��Email:��6   $��60��6)   $��10 0 0 0q�64   ���#0C48826F   �� 5G      -   5        $ EmailBox��5G      $	��150��6,   5H      �� 5J      $
 
Horizontal=�6   $	��0 5q�62   $��Center=�6?   .+�5K      �� $��Адрес:��6   $	��100��6)   ���#0C488265   �� 5L      -   5        $ 
AddressBox��5L      $	��400��6.   5M      �� 5O      $
 
Horizontal=�6   $	��0 5q�62   $��Center=�6?   .+�5P      �� $��Тип партнёра:��6   $	��100��60   ���#0C48826<   �� 5Q      -	   5         ��Name$ PartnerTypeComboBox��5Q      $	��200��68    �� DisplayMemberPath$
 Name��6D    �� SelectedValuePath$ Id��6]   5R      �� 5T      $
 
Horizontal=�6   $
��0 10q�62   $��Center=�6@   .+�5U      �� $��Логотип:��6   $	��100��6+   ���#0C488267   �� 5V      -
   5        $��Выбрать файл��5V      $	��120��60   ���#0C4882
�������6j   �� 5W      -   5         ��Name$ 	LogoImage��5W      $��80��6+   $��80��66   $��10 0 0 0q�6B   $��Uniform=�6T   5X      �� 5Z      $
 
Horizontal=�6   $
��0 10q�62   .+�5[      �� -   5        $��Сохранить��5[      $	��100��6-   ���#0C4882
�������6g   �� 5\      -   5        $��Очистить��5\      $	��100��6,   $
��10 0q�68   ���#0C4882
�������6u   �� 5]      -   5        $��Удалить��5]      $	��100��6+   $
��10 0q�67   ���#0C4882
�������6u   �� 5^      -   5        $��Заявки��5^      $	��100��6*   $
��10 0q�66   ���#0C4882
�������6n   5_      5`      5a      5b      