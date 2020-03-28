//
//  ItemCell.swift
//  PillPall CS295 Individual
//
//  Created by Jordan Genovese on 3/28/20.
//  Copyright © 2020 Jordan Genovese. All rights reserved.
//

import UIKit
class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var frequencyLabel: UILabel!
    @IBOutlet var doseageLabel: UILabel!
    @IBOutlet var isActiveLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        frequencyLabel.adjustsFontForContentSizeCategory = true
        doseageLabel.adjustsFontForContentSizeCategory = true
    }
    
    
    
}
