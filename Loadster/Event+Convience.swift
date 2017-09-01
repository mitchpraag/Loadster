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
    convenience init (nameOfEvent: String, location: String, installDate: Date, openDate: Date, priority: Bool, in context:NSManagedObjectContext) {
        self.init(context:context)
        
        self.nameOfEvent = nameOfEvent
        self.location = location
        self.installDate = installDate as NSDate
        self.openDate = openDate as NSDate 
        self.priority = priority
    }
}
