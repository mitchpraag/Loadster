//
//  CustomItemTableViewCell.swift
//  Loadster
//
//  Created by Mitch Praag on 9/7/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import UIKit

class CustomItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quanityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loadedImageLabel: UIImageView!
    @IBOutlet weak var installedImageLabel: UIImageView!
    @IBOutlet weak var returnedImageLabel: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state

    }
    
    var items: Item? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
         guard let items = items, let nameOfItem = items.nameOfItem, let quanity = items.quanity
 
            else { return }
        
        nameLabel.text = nameOfItem
        quanityLabel.text = quanity
    }
    
}


