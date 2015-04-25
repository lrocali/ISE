//
//  Model.swift
//  BillMates
//
//  Created by Lucas Rocali on 4/26/15.
//  Copyright (c) 2015 Lucas Rocali. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Model {
    
    var bills : [Bill] = [Bill]()
    
    var users : [User] = [User]()
    
    //Singleton
    private struct Static {
        static var instance: Model?
    }
    
    private init(){}
    
    class var sharedInstance: Model {
        if (Static.instance == nil) {
            Static.instance = Model()
        }
        return Static.instance!
    }
    
    func getBill(indexPath: NSIndexPath) -> Bill {
        return bills[indexPath.row]
    }
    
    func deleteBill(indexPath: NSIndexPath) {
        let bill = bills[indexPath.row]
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        managedContext.deleteObject(bill)
        
        bills.removeAtIndex(indexPath.row)
        
        var error: NSError?
        if !managedContext.save(&error) {
            abort()
        }
    }
    
    func getBills() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "Bill")
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as! [Bill]?
        
        if let results = fetchedResults {
            bills = results
        }
        else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    func saveBill(#description:String, value:String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Bill", inManagedObjectContext: managedContext)
        
        let bill = Bill(entity: entity!, insertIntoManagedObjectContext: managedContext)
        bill.attDescription = description
        bill.attValue = value
        self.bills.append(bill)
        
        
            
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    func getUser(indexPath: NSIndexPath) -> User {
        return users[indexPath.row]
    }
    
    
    func saveUser(#name:String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        
        let user = User(entity: entity!, insertIntoManagedObjectContext: managedContext)
        user.attName = name
        self.users.append(user)
        
        
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }

    func getUsers() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "User")
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as! [User]?
        
        if let results = fetchedResults {
            users = results
        }
        else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    func deleteUser(name: String) {
        var index = -1
        for i in 0..<users.count {
            if (users[i].attName == name) {
                index = i
            }
        }
        
        if index >= 0{
            let user  = users[index]
        
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
                let managedContext = appDelegate.managedObjectContext!
                managedContext.deleteObject(user)
        
                users.removeAtIndex(index)
        
                var error: NSError?
            if !managedContext.save(&error) {
                abort()
            }
        }
        else {
            println("Name not found")
        }
    }
    

}