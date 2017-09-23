//
//  CreateItemViewController.swift
//  Loadster
//
//  Created by Mitch Praag on 9/5/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import UIKit

class CreateItemViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameField.delegate = self
        quanityField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    var event: Event?
    var item: Item?
    
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var quanityField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func addItemButtonTapped(_ sender: Any) {
        
        guard let itemName: String = itemNameField.text, let quanity: String = quanityField.text, let event: Event = event else { return }
        
        let item = EventController.SharedInstance.createItem(nameOfItem: itemName, quanity: quanity, event: event)
        
        self.item = item
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addItemAndNewButtonTapped(_ sender: Any) {
        
        guard let itemName: String = itemNameField.text, let quanity: String = quanityField.text, let event: Event = event else { return }
        
        let item = EventController.SharedInstance.createItem(nameOfItem: itemName, quanity: quanity, event: event)
        
        self.item = item
        
        itemNameField.text = ""
        quanityField.text = ""
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
