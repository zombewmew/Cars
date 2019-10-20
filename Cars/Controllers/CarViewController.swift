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
    
    @IBOutlet weak var CarModel: UITextField!
    @IBOutlet weak var CarBodyType: UITextField!
    @IBOutlet weak var CarManufacturer: UITextField!
    @IBOutlet weak var CarYear: UIDatePicker!
    
    var itemArray = [CarItem]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadItems()
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        let newItem = CarItem(context: context)

        let model = CarModel.text
        let bodyType = CarBodyType.text
        let manufacturer = CarManufacturer.text
        let year = CarYear.date
        
        newItem.setValue(model, forKey: "model")
        newItem.setValue(bodyType, forKey: "bodyType")
        newItem.setValue(manufacturer, forKey: "manufacturer")
        newItem.setValue(year, forKey: "year")
        
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        itemArray.append(newItem)
            
        self.saveItem()
        self.dismiss(animated: true, completion: nil)
    }
    
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
