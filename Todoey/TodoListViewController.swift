import UIKit

class TodoListViewController: UITableViewController {

    
    // STEP ONE - Create a brand new item array to be listed on our startup TableView
    var itemArray = ["Find Mike", "Buy Eggs", "Destroy White People"]
    
    
    // STEP NINETEEN - Creating a brand new object in order to use user default (To help us save data on the user's phone when our app isn't running nomore)
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // STEP TWENTY ONE - Retrieving our data from the defaults object that now stores our itemArray with the new values that the user typed into the UIAlert appended to the end of the array. We want to create a constant called, "items" and set that constant to equal the array inside the defaults object using the key identifier we gave it in STEP TWENTY when we saved the itemArray into the defaults object. We're casting it as an array of strings. We put it in an if statement because if there is no value inside the defaults array, our app might crash.
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        
    }

    
    // STEP TWO - Tableview Datasource Methods - Creating three cells in my UITable View. Declare numberOfRowsInSection here - In order to set up a UITableView, you need to specify how many cells you want and which cells you want to be displayed. So we use the "numberOfRowsInSection" method that's returning an Int. Since we have our items coming from out itemArray in STEP ONE, we want to return the count of that array(I.E How many items is in our array). If there's 3 values in the array, we want to have 3 cells in the UITableView and etc.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }


    
    // STEP THREE - Another Tableview Datasource Methods. Declare cellForRowAtIndexPath here. This code gets triggered when the TableView finds something to be displayed in the TableView. Inside this method is where we're going to provide the cells that are going to be displayed in the TableView. This method gets called for every cell that exists in the Table View
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // STEP FOUR - Create the cell that's going to be a reusable cell, that in return is going to populate the Table View cells. The method that we're using is called, "dequeueReusableCell" with the identifier and index path. "ToDoItemCell" is the identifier of the prototype cell. The index path refers to the location of the cell that we're initializing. Ex - for the cell at row 1, what should be displayed, for the cell at row 2, what should be displayed and etc. We also have to specify the class where the individual custom list is in using "as!" and in our case, the class in the Custom Cell is named, "CustomMessageCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // STEP FIVE - We're going to use our itemArray that we created in STEP ONE that has item values stored in it to set the text label in our cells using the items stored in the array. W're going to set it's text property to equalthe items in our item array at the index path row that we're currently populating. When this entire function that this code below is in get's called, it has a row that is associated with it. Check the parameters, that should be a "cellForRowAt indexPath: IndexPath" there.
        cell.textLabel?.text = itemArray[indexPath.row]
        
        // STEP SIX - Since the function expects an output in the form of the UITableViewCell, we want to return the cell that we just created.
        return cell
        
    }
    
    
    
    // STEP SEVEN - Create Table View Delegate Methods here. This method gets called whenever we click on any of the cell in the Table View. Basically like an onclick listener for all of the cells inside the TableView
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // STEP NINE - This line of code below checks to see if the selected row that the user clicked on already has a checkmar. In that case where it already has a check mark(meaning the user already clicked on it before and is now clicking on it again), we want to take off that check mark. So basically, when they tap the cell once, it gets a checkmark. When they tap that cell again, the check mark goes away. Otherwise, if the cell that the user taps doesn't have a check mark, we want to give it a check mark. This is a Nice Lil UI Improvement for the user.
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // STEP EIGHT - This line of code below allows the cell to flash gray when selected and then go back to the cell default color to give it a sense that it's been clicked and gives it also a nice lil animation.
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    // STEP TEN - Link the Add New Item "+" Button to code
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // STEP SIXTEEN - Creating a local TextField variable that has the scope of the entire "addButtonPressed" IBAction.
        var textField = UITextField()
        
        // STEP ELEVEN - Creating Pop-Up (UIAlert Controller).
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        // STEP TWELVE - Creating the Pop-Up (UIAlert Controller) action.
        let action = UIAlertAction(title: "Add Item", style: .default)
        { (action) in
            // STEP SEVENTEEN - What will happen once the user clicks the Add Item button on our UIAlert. In our case, we want to append whatever is typed into the textfield to the end of the itemArray created in STEP ONE. Since we're inside a closure, we want to specify "self." in front of the method.
            self.itemArray.append(textField.text!)
            
            // STEP TWENTY - Save the updated item array to our user default. We have to include, "self" because we're inside of a closure. The "forekey: "TodoListArray"" is going to identify the array inside our user defaults object created in STEP NINETEEN. So "TodoListArray" is just a name we gave it to identify the array. The forekey is what's going to allow us(i.e the key) to grab back the itemArray that inside of the defaults object.
            self.defaults.setValue(self.itemArray, forKey: "TodoListArray")
            
            // STEP EIGHTEEN - The line of code below reloads the data in the tableView rows, taking in to account, the new data we just appended to the end of the itemArray above. If we don't reload, yes the item that the user typed will be appended to our array and stored in it however, it would not show in our TableView. We're also in a closure so we include the "self." in front of the method.
            self.tableView.reloadData()
        }
        
        // STEP FIFTEEN - Adding a TextField to our UIAlert where the user can type in a text inside the UIAlert Pop-up. We're going to call the Textfield that we create, "alertTextField" and in the completion block, we're going to set up the alert textfield.
        alert.addTextField { (alertTextField) in
            // STEP SIXTEEN - This is the string that's going to be shown in gray and dissapear when the user clicks on that TextField
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        // STEP THIRTEEN - Adding the action to our UIAlert
        alert.addAction(action)
        
        // STEP FOURTEEN - Showing the UIAlert (I.E, the last step in making it work. Showing it to the user when they click the "+" Button in the top right at the UI). We want it animated so we set it to true and we dont want anything special to happen upon completion so we set it to nil.
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
}

