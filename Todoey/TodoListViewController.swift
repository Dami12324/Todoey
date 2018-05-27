import UIKit

class TodoListViewController: UITableViewController {

    
    // STEP ONE - Create a brand new item array to be listed on our startup TableView
    let itemArray = ["Find Mike", "Buy Eggs", "Destroy White People"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


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
    
    
    
}

