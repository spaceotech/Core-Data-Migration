//
//  AddVC.swift
//  SOCoreDataMigration
//
//  Created by Hitesh on 10/20/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class AddVC: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionAdd(sender: AnyObject) {
        if (txtFirstName.text == "") || (txtLastName.text == "") {
            
        } else {
            Student.createInManagedObjectContext(moc, firstName: txtFirstName.text!, lastName: txtLastName.text!)
            self.actionBack(sender)
        }
    }
    
    @IBAction func actionBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
