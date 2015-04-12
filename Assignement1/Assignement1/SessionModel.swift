//
//  SessionModel.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 29/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation
 
struct Session {
    var session: String
    
    init(day:Int, time:Int){
        var dbsessions = SessionGenerator()
        session = dbsessions.day[day]! + " " + dbsessions.time[time]!
    }
}