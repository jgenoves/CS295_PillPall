//
//  PrescriptionEditorController.swift
//  PillPall CS295 Individual
//
//  Created by Jordan Genovese on 4/18/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import Foundation
import UIKit

class PrescriptionEditorViewController : UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var nameText: UITextField!
    @IBOutlet var doseageText: UITextField!
    @IBOutlet var frequencyText: UITextField!
    @IBOutlet var conditionText: UITextField!
    @IBOutlet var prescriberText: UITextField!
    @IBOutlet var medicationTypeText: UITextField!
    @IBOutlet var isActiveSwitch: UISwitch!
    @IBOutlet var lastFilledSelector: UIDatePicker!
    
    
    
    
    var prescription: Prescription!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(prescription.name == ""){
            nameText.placeholder = "Name of Prescription"
            label.text = "Add new Presciption"
        } else {
            label.text = "Edit Prescription"
            nameText.text = prescription!.name
        }
        
        if(prescription.doseage == ""){
            doseageText.placeholder = "Doseage"
        } else {
            doseageText.text = prescription!.doseage
        }
        
        if(prescription.frequency == ""){
            frequencyText.placeholder = "Frequency"
        } else {
            frequencyText.text = prescription!.frequency
        }
        
        if(prescription.patientCondition == ""){
            conditionText.placeholder = "Patient Condition"
        } else {
            conditionText.text = prescription!.patientCondition
        }
        
        if(prescription.prescriber == ""){
            prescriberText.placeholder = "Prescriber"
        } else {
            prescriberText.text = prescription!.prescriber
        }
        
        if(prescription.typeOfMedication == ""){
            medicationTypeText.placeholder = "Type of Medication"
        } else {
            medicationTypeText.text = prescription!.typeOfMedication
        }
        
        
        isActiveSwitch.setOn(prescription.isActive, animated: true)
        
        lastFilledSelector.date = prescription.lastFilled
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        prescription.name = nameText.text!
        prescription.doseage = doseageText.text!
        prescription.frequency = frequencyText.text!
        prescription.prescriber = prescriberText.text!
        prescription.patientCondition = conditionText.text!
        prescription.typeOfMedication = medicationTypeText.text!
        prescription.isActive = isActiveSwitch.isOn
        prescription.lastFilled = lastFilledSelector.date
    }
    
    
    
    
}
