   M S B A M L   `   `   `  ����G  CWpfAppShlist, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:WpfAppShlistWpfAppShlist  5           WpfAppShlist.ViewItemsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:WpfAppShlist     5        N� Title$  ViewItemsPage��5	       � 	Resources 5
         itemsViewSource  NavigateBackCommand �� Text  AddItemCommand  DeleteItemCommand��%�   &	        &	      &	 9     &	 Z     �� 5   
   6   �� 5   
   $ NavigateBack��66   �� 5   
   $ AddItem��61   �� 5   
   $ 
DeleteItem��64   5       J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command# [ 5      6H     5   
   -   5        # [ 5      6C     5   
   -   5        # [ 5      6F   .��5      �  � DataContext# [  6    � ColumnDefinitions 5   
   �� 5      $��20 �6   �� 5      �� 5      �� 5      �� 5      �� 5      �� 5      �� 5      �� 5      �� 5       �� 5!      �� 5"      �� 5#      $��20 �6    � RowDefinitions 5%   
   �� 5&      $��20 �6   �� 5'      $
��auto �6   �� 5(      $
��auto �6   �� 5)      $
��auto �6   �� 5*      $
��auto �6   �� 5+      $
��auto �6   �� 5,      $
��auto �6   �� 5-      $
��auto �6   �� 5.      �� 5/      $
��auto �6   �� 50      $��20 �6   .+�52   
   �� -   5         ��Name$ ShoppingListTextBlock��52      $��1��63   $��1��6C   $��11��6P   $��24(�6e   $��0,0,0,10q�6s   �� 53   
   $��	Add Items��6   $��1��6%   $��2��65   $��11��6B   $��16(�6W   $��0,0,0,10q�6f   �� 54   
   $��Name: ��6   $��1��6"   $��3��62   $��1��6?   $��0,0,0,10q�6S   �� 55   
   -   5        	 ��Name$	 NewItemNameTextBox��55      $��2��6.   $��3��6>   $��3��6R   $��0,0,0,10q�6_   �� 56   
   $��
Category: ��6   $��1��6&   $��4��66   $��0,0,0,10q�6C   �� 57   
   -   5        $	 NewItemCatTextBox��57      $��2��6-   $��4��6=   $��3��6J   $��0,0,0,10q�6^   �� 58   
   $��
Quantity: ��6   $��1��6&   $��5��66   $��0,0,0,10q�6C   �� 59   
   -   5        $	 NewItemQuantityTextBox��59      $��2��62   $��5��6B   $��3��6O   $��0,0,0,10q�6c   �� 5:   
   $	��Add��6   $��4��6   $��6��6/   #��[ 6<   $��0,0,0,10q�6f   �� 5;   
   $��Items in list��6   $��1��6)   $��11��69   $��7��6N   $��24(�6[   $��0,0,0,10q�6i   &   System.Windows.Controls.DataGrid  5<   
   -   5        
  Name$
 itemsDataGrid��5<         AutoGenerateColumns .  $��1��6F   $��11��6V      EnableRowVirtualization . $��8��6�      RowDetailsVisibilityMode$ VisibleWhenSelected=�6�   $��0,0,0,10q�6�   ��6�   ��    Columns 5=      4  .System.Windows.Controls.DataGridTemplateColumn  5>         CellTemplate 5?      �� 5@      .R�5A      �� $��Delete��6%   #��[ 6S   ��66   �� 6S   5B      5D      0  *System.Windows.Controls.DataGridTextColumn  5E      -	   5        
nameColumn��,  &System.Windows.Controls.DataGridColumn   Header$
 Name��5E   R      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6`   1  +System.Windows.Controls.DataGridBoundColumn   Binding 69   �� *name+6`     5F      -
   5        quantityColumn��$ Quantity��5F   Z   $ * 6l    6=   �� *
quantity+6l     5G      -   5        categoryColumn��$ Category��5G   Z   $ * 6l    6=   �� *
category+6l     5H      -   5        isBoughtColumn��$ 	Is Bought��5H   Z   $ * 6m    6=   �� *
isBought+6m   5J      �� 5K   
   $
��Back��6   $��1��6    $��9��60   #��[ 6=   5L      5M      