//
//  Cinema.swift
//  Cinema
//
//  Created by Rocali on 19/03/2015.
//  Copyright (c) 2015 Rocali. All rights reserved.
//


class Cinema {
    let name : String = ""
    let movies : [Movie] = []
    init (name: String, movies: [String]) {
        self.name = name
        for movie in movies {
            //println(movie)
            self.movies.append(Movie(name:movie))
        }
    }
}

