//
//  Item.swift
//  PillPall CS295 Individual
//
//  Created by Jordan Genovese on 3/23/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import UIKit
class Prescription: NSObject {
    var name: String
    var lastFilled: Date
    var doseage: String
    var prescriber: String
    var frequency: String
    var patientCondition: String
    var isActive: Bool
    var typeOfMedication: String
    var id: String
    
    
    init(name: String, doseage: String, prescriber: String,
         frequency: String, patientCondition: String, isActive: Bool, typeOfMedication: String, id: String) {
        self.name = name
        self.lastFilled = Date()
        self.doseage = doseage
        self.prescriber = prescriber
        self.frequency = frequency
        self.patientCondition = patientCondition
        self.isActive = isActive
        self.typeOfMedication = typeOfMedication
        self.id = id
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let names = ["Aspirin", "Med1", "Med2", "Med3"]
            let doseages = ["10 mg", "5 mg", "1 mg"]
            let prescriber = "Dr. Genovese"
            let frequencies = ["Twice Daily", "3 Times per Day", "Once with every meal"]
            let conditions = ["Back Pain", "Trouble Sleeping", "Headaches"]
            let types = ["PO", "Liquid", "Etc"]
   
            
            var idx = arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
            
            idx = arc4random_uniform(UInt32(doseages.count))
            let randomDoseage = doseages[Int(idx)]
            
            idx = arc4random_uniform(UInt32(frequencies.count))
            let randomFrequency = frequencies[Int(idx)]
            
            idx = arc4random_uniform(UInt32(conditions.count))
            let randomCondition = conditions[Int(idx)]
            
            idx = arc4random_uniform(UInt32(types.count))
            let randomType = types[Int(idx)]
            
            let randomId = UUID().uuidString.components(separatedBy: "-").first!
            
            
            let randomActiveStatus = Bool.random()
            
            
            
            self.init(
                name: randomName,
                doseage: randomDoseage,
                prescriber: prescriber,
                frequency: randomFrequency,
                patientCondition: randomCondition,
                isActive: randomActiveStatus,
                typeOfMedication: randomType,
                id: randomId
            )
            
        } else {
            self.init(
                name: "",
                doseage: "",
                prescriber: "",
                frequency: "",
                patientCondition: "",
                isActive: false,
                typeOfMedication: "",
                id: ""
            )
        }
    }

    
    
}
