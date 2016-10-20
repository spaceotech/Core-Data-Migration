//
//  ViewController.swift
//  SOCoreDataMigration
//
//  Created by Hitesh on 10/20/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tblStudent: UITableView!
    // Create an empty array of LogItem's
    var students = [Student]()
    
    // Retreive the managedObjectContext from AppDelegate
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create some dummy data to work with
        let items = [
            ("Ragav", "Dixi"),
            ("Ron", "Powel"),
            ("Athiya", "Ansule"),
            ("Reva", "Cokia")
        ]
        
        // Loop through, creating items
        for (fName, lName) in items {
            // Create an individual item
            Student.createInManagedObjectContext(moc, firstName: fName, lastName: lName)
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
         super.viewWillAppear(animated)
        fetchStudentRecord()
    }
    
    
    func fetchStudentRecord() {
        let fetchRequest = NSFetchRequest(entityName: "Student")
        
        // Create a sort descriptor object that sorts on the "title"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "fname", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        do  {
            if  let fetchResult : [Student] = try moc.executeFetchRequest(fetchRequest) as? [Student] {
                students = fetchResult
                tblStudent.reloadData()
            }
        } catch {
            print("Result Not Fetched")
        }

    }
    
    //MARK: UITableViewDataSource And Delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        // Get the LogItem for this index
        let student = students[forRowAtIndexPath.row]
        
        // Set the title of the cell to be the title of the logItem
        cell.textLabel?.text = student.fname
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    


    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

