//
//  Item+Convience.swift
//  Loadster
//
//  Created by Mitch Praag on 8/31/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import Foundation
import CoreData



extension Item {
    convenience init(nameOfItem: String, quanity: String, loaded: Bool = false, installed: Bool = false, returned: Bool = false, event: Event, in context:NSManagedObjectContext) {
        self.init(context:context)
        
        self.nameOfItem = nameOfItem
        self.quanity = quanity
        self.loaded = loaded
        self.installed = installed
        self.returned = returned
        self.event = event
    }
}
