//
//  SessionModel.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 29/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation
 
struct Session {
    var time: Int
    var day: Int
    
    
    init(day:Int, time:Int){
        self.day = day
        self.time = time
    }
}