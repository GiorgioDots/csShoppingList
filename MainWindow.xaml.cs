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
    /// Logica di interazione per MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ShoppingListEntities context = new ShoppingListEntities();
        CollectionViewSource itemsViewSource;
        CollectionViewSource shoppingListViewSource;

        public MainWindow()
        {
            InitializeComponent();
            itemsViewSource = ((CollectionViewSource)(this.FindResource("itemsViewSource")));
            shoppingListViewSource = ((CollectionViewSource)(this.FindResource("shoppingListViewSource")));
            DataContext = this;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //Creating entity objects into the context
            context.ShoppingList.Load();
            context.Items.Load();
        }
        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            //Creating entity objects into the context
            context.ShoppingList.Load();
            context.Items.Load();

            shoppingListViewSource.Source = context.ShoppingList.Local;
            itemsViewSource.Source = context.Items.Local;
            itemsViewSource.Filter += new FilterEventHandler(ShowSelectedListItems);
        }
        private void newListHandler(object sender, RoutedEventArgs e)
        {
            ShoppingList newList = new ShoppingList()
            {
                name = newListName.Text
            };
            context.ShoppingList.Add(newList);
            shoppingListViewSource.View.Refresh();
            context.SaveChanges();
            newListName.Text = "";
            MessageBox.Show("Shopping List created successfully.", "Success!");
        }
        private void addNewItem(object sender, RoutedEventArgs e)
        {
            ShoppingList selectetList = shoppingListViewSource.View.CurrentItem as ShoppingList;
            var list = (from l in context.ShoppingList
                        where l.id == selectetList.id
                        select l).FirstOrDefault();
            if(list != null)
            {
                int quantity;
                try
                {
                    quantity = int.Parse(newItemQuantity.Text);
                }catch(Exception error)
                {
                    Console.WriteLine(error.Message);
                    MessageBox.Show("The quantity must be an integer", "Error");
                    return;
                };

                Items newItem = new Items()
                {
                    id_shlist_fk = list.id,
                    name = newItemName.Text,
                    category = newItemCatName.Text,
                    quantity = quantity
                };
                context.Items.Add(newItem);
                itemsViewSource.View.Refresh();
                context.SaveChanges();
                newItemName.Text = "";
                newItemCatName.Text = "";
                newItemQuantity.Text = "";
                MessageBox.Show("Item added successfully.", "Success!");
            }
            else
            {
                MessageBox.Show("Please select a shopping list before add a new item.", "Error");
            }
        }
        private void ShowSelectedListItems(object sender, FilterEventArgs e) 
        {
            ShoppingList selectetList = shoppingListViewSource.View.CurrentItem as ShoppingList;
            Items item = e.Item as Items;
            if(item != null)
            {
                if(selectetList.id == item.id_shlist_fk)
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
        private void filterItems(object sender, RoutedEventArgs e)
        {
            itemsViewSource.Filter += new FilterEventHandler(ShowSelectedListItems);
        }

        private void removeListHandler(object sender, RoutedEventArgs e)
        {
            ShoppingList selectedList = shoppingListViewSource.View.CurrentItem as ShoppingList;

            var list = (from l in context.ShoppingList.Local
                        where l.id == selectedList.id
                        select l).First();

            if(list != null)
            {
                foreach(var item in list.Items.ToList())
                {
                    context.Items.Remove(item);
                }
                context.ShoppingList.Remove(list);
                context.SaveChanges();
                shoppingListViewSource.View.Refresh();
                MessageBox.Show("Shopping list deleted successfully", "Success!");
            }
        }

        private void removeItemHandler(object sender, RoutedEventArgs e)
        {
            Items selectedItem = itemsViewSource.View.CurrentItem as Items;

            var item = (from i in context.Items.Local
                        where i.id == selectedItem.id
                        select i).First();

            if (item != null)
            {
                context.Items.Remove(item);
                context.SaveChanges();
                itemsViewSource.View.Refresh();
                MessageBox.Show("Item deleted successfully", "Success!");
            }
        }
    }
}
