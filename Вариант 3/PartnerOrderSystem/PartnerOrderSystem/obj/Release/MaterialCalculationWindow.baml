   M S B A M L   `   `   `  ����   PartnerOrderSystem2    ,PartnerOrderSystem.MaterialCalculationWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$'  !Расчет материалов��$	��350��$	��400��.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $ ��Тип продукции:��$��0���� -    ��Name$ ProductTypeCombo��$��1�� �� DisplayMemberPath$
 Name�� �� SelectedValuePath$ Id��$��0,0,0,10q��� $ ��Тип материала:��$��2���� -   $ MaterialTypeCombo��$��3��$
 Name��$ Id��$��0,0,0,10q��� $.��(Требуемое количество:��$��4���� -    ��Name$ RequiredQuantityBox��$��5��$��0,0,0,10q��� $-��'Количество на складе:��$��6���� -   $ StockQuantityBox��$��7��$��0,0,0,10q��� -   $��Рассчитать��$��8��$��Right=�$	��100���� $��9�� �� Orientation$ 
Horizontal=�.+��� $��Результат:��$
��Bold"��� -    ��Name$ ResultLabel��$
��Bold"�