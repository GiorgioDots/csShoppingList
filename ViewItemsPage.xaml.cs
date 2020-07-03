using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Entity;

namespace WpfAppShlist
{
    /// <summary>
    /// Logica di interazione per ViewItemsPage.xaml
    /// </summary>
    public partial class ViewItemsPage : Page
    {
        ShoppingListEntities context = new ShoppingListEntities();
        CollectionViewSource itemsViewSource;
        ShoppingList selectedList;
        public ViewItemsPage(ShoppingList shList)
        {
            InitializeComponent();
            selectedList = shList;
            ShoppingListTextBlock.Text = "Selected Shopping List: " + selectedList.name;
            itemsViewSource = ((CollectionViewSource)(this.FindResource("itemsViewSource")));
            DataContext = this;
            context.Items.Load();
            itemsViewSource.Source = context.Items.Local;
            itemsViewSource.Filter += new FilterEventHandler(ShowSelectedListItems);
        }
        private void ShowSelectedListItems(object sender, FilterEventArgs e)
        {
            Items item = e.Item as Items;
            if (item != null)
            {
                if (selectedList.id == item.id_shlist_fk)
                {
                    e.Accepted = true;
                }
                else
                {
                    e.Accepted = false;
                }
            }
            else
            {
                e.Accepted = false;
            }
        }
        private void NavigateBackHandler(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
        private void AddItemHandler(object sender, RoutedEventArgs e)
        {
            if (selectedList != null)
            {
                if(NewItemQuantityTextBox.Text == "")
                {
                    NewItemQuantityTextBox.Text = "1";
                }
                int quantity;
                try
                {
                    quantity = int.Parse(NewItemQuantityTextBox.Text);
                }
                catch (Exception error)
                {
                    Console.WriteLine(error.Message);
                    MessageBox.Show("The quantity must be an integer.", "Error");
                    return;
                };

                Items newItem = new Items()
                {
                    id_shlist_fk = selectedList.id,
                    name = NewItemNameTextBox.Text,
                    category = NewItemCatTextBox.Text,
                    quantity = quantity
                };
                context.Items.Add(newItem);
                itemsViewSource.View.Refresh();
                context.SaveChanges();
                NewItemNameTextBox.Text = "";
                NewItemCatTextBox.Text = "";
                NewItemQuantityTextBox.Text = "";
                MessageBox.Show("Item added successfully.", "Success!");
            }
            else
            {
                MessageBox.Show("Please select a shopping list before add a new item.", "Error");
            }
        }
        private void DeleteItemBackHandler(object sender, RoutedEventArgs e)
        {
            Items selectedItem = itemsViewSource.View.CurrentItem as Items;
            if(selectedItem == null) {
                MessageBox.Show("Cannot delete the item, nothing selected.", "Error");
                return;
            }
            var item = (from i in context.Items.Local
                        where i.id == selectedItem.id
                        select i).First();

            if (item != null)
            {
                context.Items.Remove(item);
                context.SaveChanges();
                itemsViewSource.View.Refresh();
                MessageBox.Show("Item deleted successfully.", "Success!");
            }
            else
            {
                MessageBox.Show("Please select an item.", "Error");
            }
        }
    }
}
