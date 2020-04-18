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
        
        if(!prescription.isActive){
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
    
    @IBAction func addNewItem(_ sender: UIButton) {
        // Create a new item and add it to the store
        let newItem = prescriptionStore.createPrescription()
        // Figure out where that item is in the array
        if let index = prescriptionStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
                // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
        
    }
       
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
                // Turn off editing mode
            setEditing(false, animated: true) }
        else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            // Enter editing mode
            setEditing(true, animated: true)
            
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = prescriptionStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title, message: message,preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                // Remove the item from the store
                self.prescriptionStore.removeItem(item)
                // Also remove that row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
            })
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)
        }

    }
    
    

    override func tableView(_ tableView: UITableView,
    moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        prescriptionStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
        
    }
    	
}
