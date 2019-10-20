//
//  CarListViewController.swift
//  Cars
//
//  Created by zombewmew on 14/10/2019.
//  Copyright © 2019 Christina S. All rights reserved.
//

import UIKit
import CoreData
import SwipeCellKit

class CarListViewController: UITableViewController {

    var itemArray = [CarItem]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //loadItems()
        //if let items = defaults.array(forKey: "CarsList") as? [String]{
        //    itemArray = items
        //}
        
    }
    
    //Tableview Delegate Methods
    
    /*override func tableView(_ tableView: UITableView, didSelectedRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! CarViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCar = itemArray[indexPath.row]
        }
    }*/

    //Tableview Datasource Methods
           
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarItem", for: indexPath) as! SwipeTableViewCell
        
        //cell.delegate = self
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.model
        
        return cell
    }
    
    //Deleting Item
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        context.delete(itemArray[indexPath.row])
        itemArray.remove(at: indexPath.row)
        
        saveItem()
        
    }*/
    
    
    //Adding Item
    
    /*@IBAction func addButtonPressed(_ sender: UIBarButtonItem){
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Car", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newItem = CarItem(context: self.context)
            newItem.model = textField.text!
            //newItem.done = false
            self.itemArray.append(newItem)
            
            self.saveItem()
            
            
            //self.itemArray.append(textField.text!)
            
            //self.defaults.set(self.itemArray, forKey: "CarsList")
            
            //self.tableView.reloadData()
            
        }
                
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Create New Car"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func saveItem() {
        do{
            try context.save()
        } catch {
            print("saving error")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        let request : NSFetchRequest<CarItem> = CarItem.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("fetching error")
        }
        
    }*/


}

//Swipe Cell Delegate Methods
/*extension CategoryViewController: SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
}*/
