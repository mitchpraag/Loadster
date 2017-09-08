//
//  EventDetailTableViewController.swift
//  Loadster
//
//  Created by Mitch Praag on 9/5/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import UIKit

class EventDetailTableViewController: UITableViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = event?.nameOfEvent
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
        if let lastItem = event?.items?.lastObject as? Item {
            print("Last item added: \(lastItem.nameOfItem)")
        } else {
            print("NO ITEMS")
        }
    }
    
    
    
    var event: Event?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfItems = event?.items?.count ?? 0
        print("Number of items: \(event?.items?.count ?? 0)")
        return numberOfItems
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! CustomItemTableViewCell
        
        let item = (event?.items)?[indexPath.row]
        cell.items = item as? Item
        
        
        return cell
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemButtonTapped" {
            if let itemAddViewController = segue.destination as? CreateItemViewController {
                itemAddViewController.event = event
            }
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = event?.items?[indexPath.row]
            EventController.SharedInstance.deleteItem(item: item as! Item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
   
    
    
    
    
}
