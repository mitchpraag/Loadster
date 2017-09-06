//
//  Event+Convience.swift
//  Loadster
//
//  Created by Mitch Praag on 8/31/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import Foundation
import CoreData


extension Event {
    convenience init (nameOfEvent: String, location: String, installDate: Date, dateOfEvent: Date, priority: Bool, in context:NSManagedObjectContext) {
        self.init(context:context)
        
        self.nameOfEvent = nameOfEvent
        self.location = location
        self.installDate = installDate as NSDate
        self.dateOfEvent = dateOfEvent as NSDate
        self.priority = priority as NSNumber //why does this need to be a NS NUMBER and how do I use it
    }
}
