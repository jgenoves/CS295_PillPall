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
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    
    init() {
        print(itemArchiveURL)
        if let archivedItems =
            NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Prescription] {
            allItems = archivedItems
            
        }
    }
    
    @discardableResult func createBlankPrescription() -> Prescription {
        let newPrescription = Prescription(random: false)
        allItems.append(newPrescription)
        return newPrescription
    }
    

    @discardableResult func createPrescription() -> Prescription {
        let newPrescription = Prescription(random: true)
        allItems.append(newPrescription)
        return newPrescription
    }
    
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
        
    }
    
    func removeItem(_ item: Prescription) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
            
        }
        
    }
    
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
            
        }
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        // Remove item from array
        allItems.remove(at: fromIndex)
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex) }
}

