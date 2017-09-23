//
//  CreateEventViewController.swift
//  Loadster
//
//  Created by Mitch Praag on 8/31/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UITextFieldDelegate, UIToolbarDelegate {
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfShowField.delegate = self
        eventLocationField.delegate = self
        showDateField.inputView = eventDate
        installDateField.inputView = installDate
        showDateField.inputAccessoryView = doneButtonToolBar
        installDateField.inputAccessoryView = doneButtonToolBar
        
    }
    
    @IBOutlet weak var nameOfShowField: UITextField!
    @IBOutlet weak var eventLocationField: UITextField!
    @IBOutlet weak var PrioritySwitch: UISwitch!
    @IBOutlet weak var eventDate: UIDatePicker!
    @IBOutlet weak var installDate: UIDatePicker!
    @IBOutlet weak var installDateField: UITextField!
    @IBOutlet weak var showDateField: UITextField!
    @IBOutlet var doneButtonToolBar: UIToolbar!
    

    @IBAction func eventDatePickerChanged(_ sender: UIDatePicker) {
        showDateField.text = dateFormatter(date: eventDate.date as NSDate)
    }
    @IBAction func installDatePickerChanged(_ sender: UIDatePicker) {
        installDateField.text = dateFormatter(date: installDate.date as NSDate)
    }
    
    
    @IBAction func doneEditingDateButtonTapped(_ sender: Any) {
        installDateField.resignFirstResponder()
        showDateField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
    @IBAction func prioritySwitchTapped(_ sender: Any) {
        
    }
    
    @IBAction func createShowButtonTapped(_ sender: Any) {
        
        let eventTime = eventDate.date
        let eventInstall = installDate.date
        let priority = PrioritySwitch.isOn

        
        guard let nameOfshow: String = nameOfShowField.text, let eventLocation = eventLocationField.text else { return }
        
        let event = EventController.SharedInstance.createEvent(nameOfEvent: nameOfshow, location: eventLocation, installDate: eventInstall, dateOfEvent: eventTime, priority: priority)
        
        self.event = event
        
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dateFormatter(date: NSDate) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date as Date)
    }
  
}
