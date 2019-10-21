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
        loadItems()
        
        tableView.rowHeight = 80.0
        
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
        
        cell.delegate = self
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.model
        
        return cell
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
        tableView.reloadData()
    }

}

//Swipe Cell Delegate Methods
extension CarListViewController: SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            
            self.context.delete(self.itemArray[indexPath.row])
            self.itemArray.remove(at: indexPath.row)
            
            self.saveItem()
            
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }
}
