//
//  PrescriptionDetailController.swift
//  PillPall CS295 Individual
//
//  Created by Jordan Genovese on 3/28/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import UIKit

class PrescriptionDetailViewController: UIViewController {
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var doseageLabel: UILabel!
    @IBOutlet var isActiveImage: UIImageView!
    
    @IBOutlet var frequencyLabel: UILabel!
    
    @IBOutlet var prescriberLabel_1: UILabel!
    @IBOutlet var prescriberLabel_2: UILabel!
    
    @IBOutlet var lastFilledLabel_1: UILabel!
    @IBOutlet var lastFilledLabel_2: UILabel!
    
    @IBOutlet var conditionLabel_1: UILabel!
    @IBOutlet var conditionLabel_2: UILabel!
    
    @IBOutlet var editButton: UIButton!
    
    
    var prescription: Prescription!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = prescription.name
        typeLabel.text = prescription.typeOfMedication
        doseageLabel.text = prescription.doseage
        frequencyLabel.text = prescription.frequency
        prescriberLabel_2.text = prescription.prescriber
        lastFilledLabel_2.text = dateFormatter.string(from: prescription.lastFilled)
        conditionLabel_2.text = prescription.patientCondition
        
        if(!prescription.isActive){
            isActiveImage.tintColor = UIColor.systemGray
        }
        
        
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "editPrescription"?:
            let editPrescriptionController = segue.destination as! PrescriptionEditorViewController
            editPrescriptionController.prescription = self.prescription
        default:
            preconditionFailure("Unexpected segue identifier.")
            
        
        }
            
            
        
        
    }
    
    @IBAction func deletePrescription(_ sender: UIBarButtonItem) {
        let prescription = self.prescription
        
        let title = "Delete \(prescription!.name)?"
        let message = "Are you sure you want to delete this item?"
        let ac = UIAlertController(title: title, message: message,preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            // Remove the item from the store
            let navStack = self.view.window?.rootViewController as? UINavigationController
            let tableView = navStack?.viewControllers[0] as? PrescriptionsViewController
            tableView?.prescriptionStore.removeItem(prescription!)
            navStack?.popViewController(animated: true)
            
        })
        ac.addAction(deleteAction)
        present(ac, animated: true, completion: nil)
    }
    
    
    
    
    
}
