//
//  Cinemas.swift
//  Cinema
//
//  Created by Rocali on 20/03/2015.
//  Copyright (c) 2015 Rocali. All rights reserved.
//

import Foundation

class Cinemas  {
    var cinemas: [Cinema] = []
    
    init() {
        cinemas = [Cinema(name: "Cinema1"),Cinema(name: "Cinema2")]
        println(cinemas)
    }
    
    
}