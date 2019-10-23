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
    
    @IBOutlet weak var CarModel: UITextField!{
        didSet{
            CarModel.text = selectedCar?.model
        }
    }
    @IBOutlet weak var CarBodyType: UITextField!{
        didSet{
            CarBodyType.text = selectedCar?.bodyType
        }
    }
    @IBOutlet weak var CarManufacturer: UITextField!{
        didSet{
            CarManufacturer.text = selectedCar?.manufacturer
        }
    }
    @IBOutlet weak var CarYear: UIDatePicker!
        {
        didSet{
            if ((selectedCar?.year) != nil) {
                CarYear.date = (selectedCar?.year)!
            }
        }
    }
    
    var itemArray = [CarItem]()
    
    var selectedCar : CarItem? {
        didSet{
            //loadItem()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
       
        let model = CarModel.text
        let bodyType = CarBodyType.text
        let manufacturer = CarManufacturer.text
        let year = CarYear.date
        
        if (selectedCar?.model != nil) {
            
            selectedCar?.setValue(model, forKey: "model")
            selectedCar?.setValue(bodyType, forKey: "bodyType")
            selectedCar?.setValue(manufacturer, forKey: "manufacturer")
            selectedCar?.setValue(year, forKey: "year")
            
        } else {
            
            let newItem = CarItem(context: context)
            
            newItem.setValue(model, forKey: "model")
            newItem.setValue(bodyType, forKey: "bodyType")
            newItem.setValue(manufacturer, forKey: "manufacturer")
            newItem.setValue(year, forKey: "year")
            
            //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
            
            itemArray.append(newItem)
            
        }
        self.saveItem()
        _ = navigationController?.popViewController(animated: true)
    }
    
    func saveItem() {
        do{
            try context.save()
        } catch {
            print("saving error")
        }
    }
    
    
    func loadItem() {
        let request : NSFetchRequest<CarItem> = CarItem.fetchRequest()
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("fetching error")
        }
    }
    
    
}
