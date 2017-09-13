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
    @IBOutlet weak var LoadedButton: UIButton!
    @IBOutlet weak var InstalledButton: UIButton!
    @IBOutlet weak var returnedLabel: UIButton!

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state

    }
    
    var delegate: ItemButtonCellDelegate?

    var item: Item? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        
        guard let item = item, let nameOfItem = item.nameOfItem, let quanity = item.quanity
            else { return }
        
        nameLabel.text = nameOfItem
        quanityLabel.text = quanity
        
        updateFor(loaded: item.loaded)
        updateForInstall(installed: item.installed)
        updateForReturned(returned: item.returned)
    }
    
    //Mark: - UPDATE STATUS BUTTONS

    @IBAction func loadedButtonTapped(_ sender: AnyObject) {
        if let item = item {
            updateFor(loaded: !item.loaded)
        }
        if let delegate = delegate {
            delegate.loadButtonTapped(self)
        }
    }
    
    func updateFor(loaded: Bool) {
        if loaded {
            LoadedButton.setImage(#imageLiteral(resourceName: "TruckChecked"), for: UIControlState())
        } else {
            LoadedButton.setImage(#imageLiteral(resourceName: "Truck"), for: UIControlState())
        }
    }
    
    @IBAction func installedButtonTapped(_ sender: Any) {
        if let item = item {
            updateForInstall(installed: !item.installed)
        }
        if let delegate = delegate {
            delegate.installedButtonTapped(self)
        }
    }
    
    func updateForInstall(installed: Bool) {
        if installed {
            InstalledButton.setImage(#imageLiteral(resourceName: "installedChecked"), for: UIControlState())
        } else {
            InstalledButton.setImage(#imageLiteral(resourceName: "installed"), for: UIControlState())
        }
    }
    
    @IBAction func returnedButtonTapped(_ sender: Any) {
        if let item = item {
            updateForReturned(returned: !item.returned)
        }
        if let delegate = delegate {
            delegate.returnedButtonTapped(self)
        }
    }
    func updateForReturned(returned: Bool) {
        if returned {
            returnedLabel.setImage(#imageLiteral(resourceName: "returnedChecked"), for: UIControlState())
        } else {
            returnedLabel.setImage(#imageLiteral(resourceName: "returned-1"), for: UIControlState())
        }
    }

}
// Delegate
    protocol ItemButtonCellDelegate {
        func loadButtonTapped(_ sender: CustomItemTableViewCell)
        
        func installedButtonTapped(_ sender: CustomItemTableViewCell)
        
        func returnedButtonTapped(_ sender: CustomItemTableViewCell)
}


