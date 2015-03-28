//
//  CinemaModel.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 29/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation

struct Cinema {
    var name:String
    var logoName:String
    var movies:[Movie]
    
    init(name:String) {
        self.name = name;
        self.logoName = name.lowercaseString
        self.movies = []
        //self.movies = Movie(name: "Movie Qualquer",genre:"Fuck",synopsis:"Isso e aquilo")
    }

    mutating func setMovie(movie:Movie){
        self.movies.append(movie)
    }
}