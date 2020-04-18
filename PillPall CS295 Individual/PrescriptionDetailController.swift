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
    
    
    var prescription: Prescription!
    
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
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
    
    
    
    
    
}
