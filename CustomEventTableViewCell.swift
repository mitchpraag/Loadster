//
//  CustomEventTableViewCell.swift
//  Loadster
//
//  Created by Mitch Praag on 8/31/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import UIKit

class CustomEventTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var showOpensLabel: UILabel!
    @IBOutlet weak var installDateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet  var cellBackgroundView: UITableViewCell!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgroundView.layer.cornerRadius = 10.0
        cellBackgroundView.layer.shadowRadius = 4.0
        cellBackgroundView.layer.shadowOpacity = 1.5
        cellBackgroundView.layer.shadowColor = UIColor.black.cgColor
        cellBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 2)
        
    }
    
    //Mark: - Properties 
    
    var event: Event? {
        didSet {
            updateViews()
        }
    }
    //Set the labels

    func updateViews() {
        
        guard let event = event,
            let date = event.dateOfEvent,
            let install = event.installDate,
            let location = event.location    else { return }
        
        eventNameLabel.text = event.nameOfEvent
        showOpensLabel.text = "Start Date: \(dateFormatter(date: date))"
        installDateLabel.text = "Install Date: \(dateFormatter(date: install))"
        locationLabel.text = "Location: \(location)"
        priorityLabel.isHidden = event.priority == false

    }
  
    func dateFormatter(date: NSDate) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date as Date)
    }
    

    
}
