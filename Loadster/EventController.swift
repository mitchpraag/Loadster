//
//  EventController.swift
//  Loadster
//
//  Created by Mitch Praag on 8/31/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import Foundation
import CoreData

class EventController {
    
    static let SharedInstance = EventController()
    private let container: NSPersistentContainer
    
    
    var events: [Event] {
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        var results = [Event]()
        
        container.viewContext.performAndWait {
            do {
                results = try fetchRequest.execute()
            } catch {
                NSLog("error fetching Events: \(error)")
            }
        }
        return results
        
    }
    private init() {
        container = NSPersistentContainer(name: "Loadster")
        container.loadPersistentStores { (descprition: NSPersistentStoreDescription, error: Error?) in if let error = error {
            NSLog("error loading persisten stores: \(error)")
            }
        
        }
        }
   //Mark: - CRUD
    
    func createEvent(nameOfEvent: String, location: String, installDate: Date, dateOfEvent: Date, priority: Bool) -> Event {
        let event = Event(nameOfEvent: nameOfEvent, location: location, installDate: installDate, dateOfEvent: dateOfEvent, priority: priority, in: container.viewContext)
        save()
        return event
    }
    
    func deleteEvent(event: Event)   {
        container.viewContext.delete(event)
        save()
    }
    
    
    func add(item: Item, toEvent event: Event) {
        
    }
    
    func save() {
        do {
            try container.viewContext.save()
        } catch {
            NSLog("error saving managed obejct: \(error)")
        }
    }
    
    func createItem(nameOfItem: String, quanity: String, loaded: Bool = false, installed: Bool = false, returned: Bool = false, event: Event) -> Item {
        let item = Item(nameOfItem: nameOfItem, quanity: quanity, loaded: loaded, event: event, in: container.viewContext)
        save()
        return item
    }
    
    func deleteItem(item: Item) {
        container.viewContext.delete(item)
        save()
        }
    }
