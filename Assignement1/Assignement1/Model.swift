//
//  Model.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 29/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation

class Model {
    
    var db = DBSimulator()
    
    //Full list of Movies
    var allMovies:[Movie] = []

    var cinemas:[Cinema] = []
    
    //Singleton
    private struct Static {
        static var instance: Model?
    }
    
    class var sharedInstance: Model {
        if (Static.instance == nil) {
            Static.instance = Model()
        }
        return Static.instance!
    }
    
    //------------------
    
    init() {
        createMovies()
        createCinemas()
        fillSessions()
    }
    
    func createCinemas() {
        var numberOfCinemas = cinemas.count
        var numberOfAllMovies = allMovies.count
        
        for cinema in db.allCinemas {
            cinemas.append(Cinema(name:cinema))
        }
    
        for indexCinema in 0..<numberOfCinemas {
            for indexMovie in 0..<numberOfAllMovies{
                cinemas[indexCinema].setMovie(allMovies[indexMovie])
            }
        }
        
//        println(cinemas[1].movies[0].name)
//        println(cinemas[1].movies[3].genre)
//        println(cinemas[9].movies[0].synopsis)
        
    }

    func createMovies() {
        
        var numberOfAllMovies = allMovies.count
        for index in 0..<numberOfAllMovies {
            allMovies.append(Movie(name:db.allMoviesName[index],genre:db.allMoviesGenre[index],synopsis:db.allMoviesSynopsis[index]))
        }
    }
    
    func fillSessions() {
        var matrix = Array(count:7, repeatedValue:Array(count:5, repeatedValue:String()))
        //var matrix = [[],[]]
        
        matrix[0][1] = "Hello Rocks"
        

        println(matrix[0][1])
//        
//
//        
//        for indexCinema in 0..<numberOfCinemas {
//            var numberOfMovies = cinema[indexCinema]
//            for indexMovies in 0..<
//        }
//    
    }
    
}