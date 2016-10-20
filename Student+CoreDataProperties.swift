//
//  Student+CoreDataProperties.swift
//  SOCoreDataMigration
//
//  Created by Hitesh on 10/20/16.
//  Copyright © 2016 myCompany. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var fname: String?
    @NSManaged var lname: String?
    @NSManaged var fullname : String?
    
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, firstName: String, lastName: String) -> Student {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: moc) as! Student
        newItem.fname = firstName
        newItem.lname = lastName

        return newItem
    }
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, firstName: String, lastName: String, fullName: String) -> Student {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: moc) as! Student
        newItem.fname = firstName
        newItem.lname = lastName
        newItem.fullname = fullName
        return newItem
    }

}
