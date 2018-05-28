import UIKit

class TodoListViewController: UITableViewController {

    
    // STEP ONE - Create a brand new item array to be listed on our startup TableView. The array is empty and it's of Data Type Item meaning that it can only hold Item objects from the Data Model, Item class that holds the blueprint
    var itemArray = [Item]()
    
    
    // STEP NINETEEN - Creating a brand new object in order to use user default (To help us save data on the user's phone when our app isn't running nomore)
    // let defaults = UserDefaults.standard
    
    
    // STEP THIRTY FOUR - Creating a file path to the document's folder that IOS gives us where our app will be stored in the user's device. This is also a singleton BTW meaning that there can only be one copy of it that can be shared across all of our classes and objects. The "for" paramater we need to pass in a argument for is the document directory. The "in" parameter is the location that we're going to look for it. I.E the user's home directory. -> The place where we're going to save their personal items assocaited with this current app that we're building. We're storing this file path into a constant. Because this is an array (created by apple), we're going to item out of the array and tap into the appending pathcomponent method. The argument passed in this paramater, we can call anything we want. We called it, "Items.plist"
    let  dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // STEP TWENTY FOUR - Creating a new object item from the item class in the Data Model Folder that holds the blueprint : As of STEP FORTY FOUR, we no longer need this hard coded initialization.
//        let newItem = Item()
//        newItem.title = "Find Mike"
//        itemArray.append(newItem)
//
//        let newItem2 = Item()
//        newItem2.title = "Buy Eggs"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "Destroy Cancer"
//        itemArray.append(newItem3)
        
        
    
        // STEP TWENTY ONE && STEP THIRTY THREE - Retrieving our data from the defaults object that now stores our itemArray with the new values that the user typed into the UIAlert appended to the end of the array. We want to create a constant called, "items" and set that constant to equal the array inside the defaults object using the key identifier we gave it in STEP TWENTY when we saved the itemArray into the defaults object. We're casting it as an array of Data Type, "Item" from the Data Model folder, Item class. We put it in an if statement because if there is no value inside the defaults array, our app might crash. STEP TWENTY TWO is in the Data Model folder, Item class.
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = items
//        }
        
        
        // STEP FORTY - Rather than the code above, we're going to call a method called, "loadItems" that we'll create in STEP FORTY ONE. It will decode our itemArray
        loadItems()
    }

    
    // STEP TWO - Tableview Datasource Methods - Creating three cells in my UITable View. Declare numberOfRowsInSection here - In order to set up a UITableView, you need to specify how many cells you want and which cells you want to be displayed. So we use the "numberOfRowsInSection" method that's returning an Int. Since we have our items coming from out itemArray in STEP ONE, we want to return the count of that array(I.E How many items is in our array). If there's 3 values in the array, we want to have 3 cells in the UITableView and etc.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }


    
    // STEP THREE - Another Tableview Datasource Methods. Declare cellForRowAtIndexPath here. This code gets triggered when the TableView finds something to be displayed in the TableView. Inside this method is where we're going to provide the cells that are going to be displayed in the TableView. This method gets called for every cell that exists in the Table View. This the delegate method that figures how we should display the cells in the Table View.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // STEP FOUR - Create the cell that's going to be a reusable cell, that in return is going to populate the Table View cells. The method that we're using is called, "dequeueReusableCell" with the identifier and index path. "ToDoItemCell" is the identifier of the prototype cell. The index path refers to the location of the cell that we're initializing. Ex - for the cell at row 1, what should be displayed, for the cell at row 2, what should be displayed and etc. We also have to specify the class where the individual custom list is in using "as!" and in our case, the class in the Custom Cell is named, "CustomMessageCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        
        // STEP THIRTY - Instead of using, "indexPath.row" way too many times within our code, we want to create a constant that holds that. Remember, "indexPath.row" is the one that tells us which cell the user clicked on. It's getting the index path of it from our Table View and is the specific cell row.
        let item = itemArray[indexPath.row]
        
        
        // STEP FIVE - We're going to use our itemArray that we created in STEP ONE that has item values stored in it to set the text label in our cells using the items stored in the array. W're going to set it's text property to equalthe items in our item array at the index path row that we're currently populating. When this entire function that this code below is in get's called, it has a row that is associated with it. Check the parameters, that should be a "cellForRowAt indexPath: IndexPath" there. "itemArray[indexPath.row]" - itemArray at indexPath row is going to return an item object so we want to tap into the "title" property that's why we include the ".title" after
       // cell.textLabel?.text = itemArray[indexPath.row].title
        
       // STEP THIRTY ONE - This is an update of the code above. Now that we have a constant named item that holds the indexPath.row, we can substitute and make our code look alot nicer.
        cell.textLabel?.text = item.title
        
        
        
        // STEP TWENTY EIGHT - We want to say that if the property (done) of the current row is equal to true, we want to add a checkmark to the cell row. If it isn't, we want to take away the checkmark from the cell row.
//        if itemArray[indexPath.row].done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        // STEP THIRTY TWO - This is an update of the code above. Now that we have a constant named item that holds the indexPath.row, we can substitute and make our code look a lot nicer. We can also do so using a Ternary operator. SYNTAX => | Value = Condition ? valueIfTrue : valueIfFalse | "item.done" would result in a boolean value because the property, "done" has a Boolean DataType so we dont need to say, "cell.accessoryType = item.done == true ?"
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        
        // STEP SIX - Since the function expects an output in the form of the UITableViewCell, we want to return the cell that we just created.
        return cell
        
    }
    
    
    
    
    
    // STEP SEVEN - Create Table View Delegate Methods here. This method gets called whenever we click on any of the cell in the Table View. Basically like an onclick listener for all of the cells inside the TableView
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // STEP TWENTY SEVEN - Setting the property of the selected item. We're tapping into the itemArray at the indexPath's row (I.E - The current row that is selected) and we want to tap into the title property of that row because remember, we populate it using the objects stored in the item Array. We're setting the done property to be the opposite of what it used to be. We do this using a Ternary Operator. This is basically saying, if the done property is not true (since it's a boolean, we don't have to specify a, "==" with a value) then set it to true and if it is true, set it to not true.
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
            // Code above, does the exact same thing as this line of code below that's commented out. It just shortens our code to look better and less cluthered.
//            if itemArray[indexPath.row].done == false {
//                itemArray[indexPath.row].done = true
//            } else {
//                itemArray[indexPath.row].done = false
//            }
        
        
        
        // STEP NINE - This line of code below checks to see if the selected row that the user clicked on already has a checkmar. In that case where it already has a check mark(meaning the user already clicked on it before and is now clicking on it again), we want to take off that check mark. So basically, when they tap the cell once, it gets a checkmark. When they tap that cell again, the check mark goes away. Otherwise, if the cell that the user taps doesn't have a check mark, we want to give it a check mark. This is a Nice Lil UI Improvement for the user.
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        
        // STEP THIRTY NINE - Rather than type the entire code here, we can just put them in a function and call it here (The lines of code below). Since we're inside of a closure, we have to put, "self" in front of it.
        self.saveItems()
        
        
        // STEP TWENTY NINE - This Method below forces the TableView to call it's datasource method again so that it reloads the data that is supposed to be inside.
       // tableView.reloadData() - > We delete this and don't need it anymore because it exists in the function that we call above -> in (STEP THIRTY NINE)
        
        
        
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
            
            
            // STEP TWENTY FIVE - Creating a newItem that is of type "Item" -> From the Data Model folder, Item class. So we're saving whatever the user typed into the textField "+" Button in the UIAlert to the title property in the new Object we just created using the Item class.
            let newItem = Item()
            newItem.title = textField.text!
            
            
            // STEP SEVENTEEN && STEP TWENTY SIX - What will happen once the user clicks the Add Item button on our UIAlert. In our case, we want to append whatever is typed into the textfield to the end of the itemArray created in STEP ONE. Since we're inside a closure, we want to specify "self." in front of the method. This is a code touch up after STEP TWENTY FIVE from above. Now, that we saved whatever the user typed into the UIAlert to our newly created object's property (title) named, "newItem", we can append the object to our array now.
            self.itemArray.append(newItem)
            

            
            // STEP THIRTY NINE - Rather than type the entire code here, we can just put them in a function and call it here (The lines of code below). Since we're inside of a closure, we have to put, "self" in front of it.
            self.saveItems()
            
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
    
    
    
    
    // STEP THIRTY EIGHT - Creating a new method that saves items in our item array to the propertylist encoder
    func saveItems() {
        
        // STEP TWENTY - Save the updated item array to our user default. We have to include, "self" because we're inside of a closure. The "forekey: "TodoListArray"" is going to identify the array inside our user defaults object created in STEP NINETEEN. So "TodoListArray" is just a name we gave it to identify the array. The forekey is what's going to allow us(i.e the key) to grab back the itemArray that inside of the defaults object.
        // self.defaults.setValue(self.itemArray, forKey: "TodoListArray")
        
        
        // STEP THIRTY FIVE - Rather than the Code in STEP TWENTY that saves the items in the array to our defaults, we want to instead creating something called an Enconder. The encoder is a new object of the Data Type "PropertyListEncoder()" from the method given to us by apple.
        let encoder = PropertyListEncoder()
        
        
        // STEP THIRTY SIX - Encoding our data (I.E our Item Array) into the property list. The "encode()" method can throw an error so we put this in a do, try, catch block. STEP THIRTY SEVEN is in the Data Model, Item class.
        do {
            let data = try encoder.encode(itemArray)
            
            // Once we've encoded our data, the next step is to write the data to our File Path created in STEP THIRTY FOUR with a constant named, "dataFilePath". This is also a method that can throw errors so we have to mark it with a try, block.
            try data.write(to: dataFilePath!)
        } catch {
            // If there is an error, encoding our data (I.E our Item Array) into a property list, we want to print that error out for us the Developer to be able to see.
            print("Error encoding item array, \(error)")
        }
        
        
        // STEP EIGHTEEN - The line of code below reloads the data in the tableView rows, taking in to account, the new data we just appended to the end of the itemArray above. If we don't reload, yes the item that the user typed will be appended to our array and stored in it however, it would not show in our TableView. We're also in a closure so we include the "self." in front of the method.
        self.tableView.reloadData()
        
    }
    
    
    
    
    // STEP FORTY ONE - Creating the loadItems() Method
    func loadItems() {
        
        // STEP FORTY TWO - We're tapping into our data by creating a constant and setting the data using the contents of the url. The contents of the URL is our file path constant that we created in STEP THIRTY FOUR. This aswell is a method that can throw an error so we implement the try block which will turn the object into an optional. Now we can use optional binding to unwrap it safely without the app crashing.
        if let data = try? Data(contentsOf: dataFilePath!) {
            
            
           // STEP FORTY THREE - Create a Decoder to Decode our object since we have an Encoder in the function, STEP THIRTY EIGHT.
           let decoder = PropertyListDecoder()
            
           
           // STEP FORTY FOUR - Decoding our data (I.E our Item Array) into the property list. The "decode()" method can throw an error so we put this in a do, try, catch block. The first parameter of the decode method is specifying the DataType that you want it to decode. (In our case, an an array of Data Type Items(From the Data Model folder, Item class). Because we're not specifying objects, in order to refer to the Type of the array of Items, we have to specify, ".self"). The second parameter is the data which in our case is the data that we safely unwrapped in STEP FORTY TWO. The next STEP, STEP FORTY FIVE is in the Data Model folder, Item class file.
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error, decoding item array, \(error)")
            }
            
        }
        
    }
    
    
    
}

