//
//  CarViewController.swift
//  Cars
//
//  Created by zombewmew on 18/10/2019.
//  Copyright © 2019 Christina S. All rights reserved.
//

import UIKit
import CoreData

class CarViewController: UIViewController {
    
    var itemArray = [CarItem]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadItems()
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let newItem = CarItem()
        let textField = UITextField()
        let model = textField.text
        newItem.setValue(model, forKey: "model")
        //newItem.done = false
        
        itemArray.append(newItem)
            
        self.saveItem()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        // save something
        self.dismiss(animated: true, completion: nil)
    }
        
        //self.itemArray.append(textField.text!)
        
        //self.defaults.set(self.itemArray, forKey: "CarsList")
        
        //self.tableView.reloadData()
        
    //}
            
    //alert.addTextField{(alertTextField) in
      //  alertTextField.placeholder = "Create New Car"
        //textField = alertTextField
    //}
    
    //alert.addAction(action)
    
    //present(alert, animated: true, completion: nil)
    
    
    func saveItem() {
        do{
            try context.save()
        } catch {
            print("saving error")
        }
        
        //self.tableView.reloadData()
    }
    
    func loadItems() {
        let request : NSFetchRequest<CarItem> = CarItem.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("fetching error")
        }
        
    }
    
    
}
