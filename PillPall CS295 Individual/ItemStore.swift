//
//  ItemStore.swift
//  PillPall CS295 Individual
//
//  Created by Jordan Genovese on 3/23/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//


//Creates an ItemStore for the Prescription Object

import UIKit
import Foundation

class ItemStore {
    
    var allItems = [Prescription]()

    init() {
        
        for _ in 0..<5 {
            createPrescription()
        }
    }
    

    @discardableResult func createPrescription() -> Prescription {
        let newPrescription = Prescription(random: true)
        allItems.append(newPrescription)
        return newPrescription
    }
    
}

