//
//  ItemsController.swift
//  PillPall CS295 Individual
//
//  Created by Jordan Genovese on 3/23/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import UIKit
import Foundation

class PrescriptionsViewController: UITableViewController {
    
    var prescriptionStore: ItemStore!
    
    override func viewDidLoad() { super.viewDidLoad()
    // Get the height of the status bar
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
    tableView.contentInset = insets
    tableView.scrollIndicatorInsets = insets
    
    tableView.rowHeight = 65
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prescriptionStore.allItems.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance

        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        // Set the text on the cell with the description of the item // that is at the nth index of items, where n = row this cell // will appear in on the tableview
        let prescription = prescriptionStore.allItems[indexPath.row]
        
        cell.nameLabel.text = prescription.name
        cell.frequencyLabel.text = prescription.frequency
        cell.doseageLabel.text = prescription.doseage
        
        if(prescription.isActive){
            cell.isActiveLabel.tintColor = UIColor.systemGray
        }

        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "showPrescription"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let prescription = prescriptionStore.allItems[row]
                let detailViewController = segue.destination as! PrescriptionDetailViewController
                detailViewController.prescription = prescription
            }
        
        default:
            preconditionFailure("Unexpected segue identifier.")
            
        }
        
        
    
    }
    	
}
