   M S B A M L   `   `   `  ����G  CWpfAppShlist, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:WpfAppShlistWpfAppShlist  5      !    WpfAppShlist.CreateListPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:WpfAppShlist     5        N� Title$  CreateListPage��5	       � 	Resources 5
         shoppingListViewSource  DeleteListCommand �� Text  CreateListCommand  ViewListCommand  bool2VisibilityConverter  WindowBackgroundColor  HighlightColor  	BlueColor  ForegroundColor 	 WindowBackgroundColorBrush �� Color 
 HighlightColorBrush  BlueColorBrush  ForegroundColorBrush  WindowButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType ��Name	 J� SnapsToDevicePixels
 �� Triggers P� Property P� Value �� 
TargetName��%�  &	        &	      &	 3     &	 S     &	 q     &	 �     &	 �     &	 �     &	 �     &		     7  &	
      7  &	 8    7  &	 P    7  &	 h    7 
 �� 5   
   6   �� 5   
   $ Delete��64   �� 5   
   $ Create��64   �� 5   
   $
 View��62   �� 5   
   6'   ��5   
   	#FF2D2D30��69   ��5   
   	#FF3F3F41��62   ��5   
   	#FF007ACC��6-   ��5   
   	#FFF4F4F5��63   �� 5   
   8   6=   �� 5   
   8   66   �� 5   
   8   61   �� 5   
   8   67   �� 5   
   " ��6*   .�5      ��  � ��# �  6+   �� 5       � ��
 ���� 6+   �� 5       � ��$ Center=�6;   �� 5       � ��$ Center=�69   �� 5       � ��$ 1q�6(   �� 5        � �� 5!      �� 5"      " ��6&   .R�5#      � #��z��6   .+�5$      �� $ contentPresenter��6/   #��z��5%      #��z��5&      #	 z	 5'      #��z��5(      ��. 5)      5*      
 5+      P� 5,       �@J�IsMouseOver . . �5-   "   �� 8    � ��6?   5.      P� 5/       � �� . . �50   "   �� # �  6?    � ��51      P� 52       � {� .  . �53   "   �� $ contentPresenter��6)    �@J�Opacity$ .5Q�6Z   54      56      58      59      5:       J� CommandBindings 5;      )  #System.Windows.Input.CommandBinding  5<   
   -   5           Command# [ 5<      6F     5=   
   -   5        # [ 5=      6F     5>   
   -   5        # [ 5>      6D   .��5@      �  � DataContext# [  6    � ColumnDefinitions 5A   
   �� 5B      $��20 �6   �� 5C      �� 5D      �� 5E      �� 5F      �� 5G      �� 5H      �� 5I      �� 5J      �� 5K      �� 5L      �� 5M      �� 5N      $��20 �6    � RowDefinitions 5P   
   �� 5Q      $��20 �6   �� 5R      $
��auto �6   �� 5S      $
��auto �6   �� 5T      $
��auto �6   �� 5U      $
��auto �6   �� 5V      $��* �6   �� 5W      $
��auto �6   �� 5X      $��20 �6   .+�5Z   
   �� $��Create a new list��6   $��1��6-   $��1��6=   $��11��6J   $��24(�6_   $��0,0,0,10q�6m   �� 5[   
   $��Shopping List name:��6   $��1��6/   $��2��6?   $��3��6L   �� 5\   
   -   5         ��Name$ newListNameTextBox��5\      $��4��6.   $��2��6>   $��0,0,0,10q�6K   $��3��6]   �� 5]   
   -   5         ��Name$ createNewListButton��5]      $��6��6.   $��3��6>   $��Create��6K   #��[ 6\   #��[ 6�   �� 5^   
   $��All Shopping Lists��6   $��1��6.   $��4��6>   $��11��6K   $��24(�6`   $��	0,10,0,10q�6n   &   System.Windows.Controls.DataGrid  5_   
   -   5          Name$ shoppingListDataGrid��5_         AutoGenerateColumns .     EnableRowVirtualization .    RowDetailsVisibilityMode$ VisibleWhenSelected=�6�   $��1��6�   $��11��6�   $��5��6�   $��0,0,0,10q�6�   ��6l   ��    Columns 5`      4  .System.Windows.Controls.DataGridTemplateColumn  5a         CellTemplate 5b      �� 5c      .R�5d      �� $��Delete��6%   #��[ 66   ��6c   �� 5e      5g      0  *System.Windows.Controls.DataGridTextColumn  5h      -   5        
nameColumn��,  &System.Windows.Controls.DataGridColumn   Header$
 name��5h   R      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6`   1  +System.Windows.Controls.DataGridBoundColumn   Binding 69   �� *name+6`   5j      �� 5k   
   -   5        $ viewListButton��5k      $��11��6)   $��6��6:   $
��View��6G   #��[ 6V   5l      5m      