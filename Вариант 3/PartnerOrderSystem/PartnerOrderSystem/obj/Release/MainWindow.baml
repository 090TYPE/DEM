   M S B A M L   `   `   `  ����   PartnerOrderSystem#    PartnerOrderSystem.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$  Партнёры��$	��600��$
��1000�����#FFFFFF$%��Bahnschrift Light SemiCondensed)�.��� $��10q� � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+�]� $��0��$��0 0 0 10q���. .+��� $/��)pack://application:,,,/Resources/logo.png��$	��100��$	��100��$��Uniform=�$	��Top=�$
��Left=�$��0 0 10 0q��� $��Партнёры��$��24(�$
��Bold"�$��Center=����#0C4882�� $��1��$
��Auto=�$
��Auto=�$	��200��$	��300��.��&   System.Windows.Controls.DataGrid  -     Name$ PartnersGrid��   AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=����#FFFFFF$%��Bahnschrift Light SemiCondensed)�
���   �$��0q�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Название��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 �� *Name+  $ Директор��$ * 	 �� *DirectorName+  $ ИНН��$	 100 	 �� *INN+  $ Телефон��$	 100 	 �� *Phone+  $ Email��$	 150 	 �� *Email+  $ Рейтинг��$ 60 	 �� *Rating+�� $��2��
 �� Orientation$
 Vertical=����#BBDCFA$��0q�.+��� $J��DРедактирование / Добавление партнёра��$
��Bold"�$��16(�$��0 0 0 10q����#0C4882�� $
 
Horizontal=�$	��0 5q�.+��� $��Название:��$	��100�����#0C4882�� -    ��Name$ NameBox��$	��200���� $��ИНН:��$��50��$��10 0 0 0q����#0C4882�� -   $ INNBox��$	��120���� $��Рейтинг:��$��60��$��10 0 0 0q����#0C4882�� -   $ 	RatingBox��$��50���� $
 
Horizontal=�$	��0 5q�.+��� $��Директор:��$	��100�����#0C4882�� -   $ DirectorBox��$	��200���� $��Телефон:��$��60��$��10 0 0 0q����#0C4882�� -   $ PhoneBox��$	��120���� $��Email:��$��60��$��10 0 0 0q����#0C4882�� -   $ EmailBox��$	��150���� $
 
Horizontal=�$	��0 5q�$��Center=�.+��� $��Адрес:��$	��100�����#0C4882�� -   $ 
AddressBox��$	��400���� $
 
Horizontal=�$	��0 5q�$��Center=�.+��� $��Тип партнёра:��$	��100�����#0C4882�� -	    ��Name$ PartnerTypeComboBox��$	��200�� �� DisplayMemberPath$
 Name�� �� SelectedValuePath$ Id���� $
 
Horizontal=�$
��0 10q�$��Center=�.+��� $��Логотип:��$	��100�����#0C4882�� -
   $��Выбрать файл��$	��120�����#0C4882
��������� -    ��Name$ 	LogoImage��$��80��$��80��$��10 0 0 0q�$��Uniform=��� $
 
Horizontal=�$
��0 10q�.+��� -   $��Сохранить��$	��100�����#0C4882
��������� -   $��Очистить��$	��100��$
��10 0q����#0C4882
��������� -   $��Удалить��$	��100��$
��10 0q����#0C4882
��������� -   $��Дальше��$	��100��$
��10 0q����#0C4882
�������