//
//  MovieModel.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 29/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation

struct Movie {
    var name:String
    var imageName:String
    var synopsis:String
    var genre:String
    var sessions:[Session]
    
    init(name:String,genre:String,synopsis:String) {
        self.name = name
        self.synopsis = synopsis
        var lowerName =  name.lowercaseString + ".jpg"
        self.genre = genre
        self.sessions = []
        
        self.imageName = lowerName.condenseWhitespace()
        
        println(self.imageName)
    }
    
    
}

extension String {
    func condenseWhitespace() -> String {
        let components = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).filter({!Swift.isEmpty($0)})
        return "".join(components)
    }
}