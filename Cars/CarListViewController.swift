//
//  ViewController.swift
//  Cars
//
//  Created by zombewmew on 14/10/2019.
//  Copyright © 2019 Christina S. All rights reserved.
//

import UIKit

class CarListViewController: UITableViewController {

    let itemArray = ["Volkswagen Käfer", "Nissan Micra", "Mini Cooper"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    //Tableview Datasource Methods
           
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarItem", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    

}

