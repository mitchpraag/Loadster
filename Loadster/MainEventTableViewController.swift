//
//  MainEventTableViewController.swift
//  Loadster
//
//  Created by Mitch Praag on 8/31/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import UIKit



class MainEventTableViewController: UITableViewController, UITextFieldDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventController.SharedInstance.events.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! CustomEventTableViewCell
        let event = EventController.SharedInstance.events[indexPath.row]
        cell.event = event
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let event = EventController.SharedInstance.events[indexPath.row]
            EventController.SharedInstance.deleteEvent(event: event)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }

        //Prepare for Segue
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEventDetailView" {
            
            if let eventDetailViewController = segue.destination as? EventDetailTableViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                
                let event = EventController.SharedInstance.events[selectedIndex]
                eventDetailViewController.event = event
            }
        }
    }
}


