//
//  Bill.swift
//  BillMates
//
//  Created by Lucas Rocali on 4/26/15.
//  Copyright (c) 2015 Lucas Rocali. All rights reserved.
//

import Foundation
import CoreData

class Bill: NSManagedObject {
    @NSManaged var attDescription: String
    @NSManaged var attValue: String
    
    func getDescrition()->String {
        return self.attDescription as String
    }
    
    func getValue()->String {
        return self.attValue as String
    }
}
