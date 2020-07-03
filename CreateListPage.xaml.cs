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
    /// Logica di interazione per CreateListPage.xaml
    /// </summary>
    public partial class CreateListPage : Page
    {
        ShoppingListEntities context = new ShoppingListEntities();
        CollectionViewSource shoppingListViewSource;
        public CreateListPage()
        {
            InitializeComponent();
            shoppingListViewSource = ((CollectionViewSource)(this.FindResource("shoppingListViewSource")));
            DataContext = this;
            context.ShoppingList.Load();
            shoppingListViewSource.Source = context.ShoppingList.Local;
        }
        private void DeleteListCommandHandler(object sender, RoutedEventArgs e)
        {
            ShoppingList selectedList = shoppingListViewSource.View.CurrentItem as ShoppingList;
            if (selectedList == null)
            {
                MessageBox.Show("Cannot delete the Shopping List, nothing selected.", "Error");
                return;
            }
            var list = (from l in context.ShoppingList.Local
                        where l.id == selectedList.id
                        select l).First();

            if (list != null)
            {
                foreach (var item in list.Items.ToList())
                {
                    context.Items.Remove(item);
                }
                context.ShoppingList.Remove(list);
                context.SaveChanges();
                shoppingListViewSource.View.Refresh();
                MessageBox.Show("Shopping list deleted successfully", "Success!");
            }
        }
        private void CreateListCommandHandler(object sender, RoutedEventArgs e)
        {
            if(newListNameTextBox.Text == "")
            {
                MessageBox.Show("Please insert a Shopping List Name", "Validation Error");
                return;
            }
            ShoppingList newList = new ShoppingList()
            {
                name = newListNameTextBox.Text
            };
            context.ShoppingList.Add(newList);
            shoppingListViewSource.View.Refresh();
            context.SaveChanges();
            newListNameTextBox.Text = "";
            MessageBox.Show("Shopping List created successfully.", "Success!");
        }
        private void ViewListCommandHandler(object sender, RoutedEventArgs e)
        {
            ShoppingList selectedList = shoppingListViewSource.View.CurrentItem as ShoppingList;
            ViewItemsPage nextPage = new ViewItemsPage(selectedList);
            NavigationService.Navigate(nextPage);
        }
    }
}
