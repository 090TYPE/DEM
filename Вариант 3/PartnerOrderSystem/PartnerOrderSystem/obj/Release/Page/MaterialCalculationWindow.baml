   M S B A M L   `   `   `  ����   PartnerOrderSystem2    ,PartnerOrderSystem.MaterialCalculationWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$'  !Расчет материалов��$	��350��$	��400�����#FFFFFF$%��Bahnschrift Light SemiCondensed)�.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $ ��Тип продукции:��$��0�����#0C4882$
��Bold"��� -    ��Name$ ProductTypeCombo��$��1�� �� DisplayMemberPath$
 Name�� �� SelectedValuePath$ Id��$��0,0,0,10q��� $ ��Тип материала:��$��2�����#0C4882$
��Bold"��� -   $ MaterialTypeCombo��$��3��$
 Name��$ Id��$��0,0,0,10q��� $.��(Требуемое количество:��$��4�����#0C4882$
��Bold"��� -    ��Name$ RequiredQuantityBox��$��5��$��0,0,0,10q��� $-��'Количество на складе:��$��6�����#0C4882$
��Bold"��� -   $ StockQuantityBox��$��7��$��0,0,0,10q��� -   $��Рассчитать��$��8��$��Right=�$	��100�����#0C4882
�������$��6q��� $��9�� �� Orientation$ 
Horizontal=�$��0,10,0,0q�.+��� $��Результат:��$
��Bold"����#0C4882�� -    ��Name$ ResultLabel��$
��Bold"����#0C4882$��10,0,0,0q�