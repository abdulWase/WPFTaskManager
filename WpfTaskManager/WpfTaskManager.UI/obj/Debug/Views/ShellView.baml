   M S B A M L   `   `   `  ����L  HWpfTaskManager.UI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:WpfTaskManager.UI.ViewsWpfTaskManager.UI.Views  5   	   5clr-namespace:WpfTaskManager.UIWpfTaskManager.UI  5   	   '    !WpfTaskManager.UI.Views.ShellView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:WpfTaskManager.UI.Views     5   	   0mainclr-namespace:WpfTaskManager.UI     5   	   ^ ZCaliburn.Micro.Platform, Version=4.0.0.0, Culture=neutral, PublicKeyToken=8e5891231f2ed21f(calhttp://www.caliburnproject.org  5   	   $��16(�5
   	     � Title$  Task Manager Application��5   	   $	��450��6*   $	��800��67    � 	Resources 5      (   "WpfTaskManager.UI.DueDateConverter   DueDateConverter01��%   &	          5   
   6    5      .��5      �  � RowDefinitions 5   
   �� 5      $��20 �6   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $��* �6   .+�5   
   �� $��1��6    �� Orientation$ 
Horizontal=�6"   $��Center=�6;   .+�5      �� Current Date:6(   �� 5      -   5         ��Name$ CurrentDate��5      6/   5      �� 5   
   $��2��6   
����  �$��3q�63   $��Create New task��5      .��5      �  5      �� 5       $
��auto �6$   �� 5!      $��50 �6$    � ColumnDefinitions 5#      �� 5$      $��* �6'   �� 5%      $��* �6'   �� 5&      $��* �6'   .+�5(      �� $��0��6   .+�5)      �� .��6   
Task Name:6)   �� 5*      -   5         ��Name$ NewTaskName��5*      $��	10,0,10,0q�63   $	��100��6F     errorTemplate =� ErrorTemplate# [ 5+      ��5*   U   �� *NewTaskName+ �� UpdateSourceTrigger$ PropertyChanged=�	 �� ValidatesOnDataErrors	 . 5+   V   5,      �� 5-      $��1��6   .+�5.      �� .��6   	Due Date:6(   (  "System.Windows.Controls.DatePicker  5/      -   5        
  Name$
 
NewDueDate��5/   !   $��	10,0,10,0q�65   $	��100��6H   # [ 50         SelectedDate 5/   W   �� *
NewDueDate+$ PropertyChanged=�	 . 51       52      �� 53      -   5         ��Name$ NewTask��53      $��2��6*     Caliburn.Micro.Message   Attach$ AddTask��6:   $��10q�6W   $��Center=�6c   .��6�   Add New Task6�   54      56      &   System.Windows.Controls.DataGrid  57   
   -   5          Name$ Tasks��57      $��3��6"      CanUserAddRows .     AutoGenerateColumns .     RowStyle 58      �� 59       �� 
TargetType)  #System.Windows.Controls.DataGridRow"  6    �� Triggers 5:      �� 5;       �� Binding 6&   ��  �� Path$ Status� �� Value 	Completed6F   .a�5<      ��  �� Property � �� �� Value
 �/���6Q   5=      .�5?      ��  � �� 63   �� $ DueDate� �� 	Converter# [  6�   5@         Columns 5B      0  *System.Windows.Controls.DataGridTextColumn  5C      ,  &System.Windows.Controls.DataGridColumn   Header$
 Name��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6Q   1	  +System.Windows.Controls.DataGridBoundColumn 	  Binding 63   �� $
 Name�6Q   4
  .System.Windows.Controls.DataGridTemplateColumn
  5D      $ Due Date��6)      
IsReadOnly . $
 Auto 6M    
  CellTemplate 5E      �� 5F      .R�5G      �� ��6(   �� $ DueDate�  �� StringFormat$  d��5H      5J        5K      $ Status��6%   $
 Auto 6U    65   �� $ Status�6U   
  5L      $  ��6)   $
 Auto 63    5M      �� 5N      .R�5O      �� $! CompletedTask($dataContext)��6%   $��10q�6V   .��6b   
Complete6l   5P      5R      
  5S      $  ��6)   $
 Auto 63    5T      �� 5U      .R�5V      �� $ RemoveTask($dataContext)��6%   $��10q�6T   .��6`   Delete6h   5W      5Y      5\      5]      5^      