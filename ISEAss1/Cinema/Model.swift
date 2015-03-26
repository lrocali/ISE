//
//  Model.swift
//  Cinema
//
//  Created by Rocali on 20/03/2015.
//  Copyright (c) 2015 Rocali. All rights reserved.
//
import Foundation

class Model {
    
    //Creating Dictionary of cinemas and their movies
    let cinemas = ["Cineplex Australia": ["movie 1","movie 2"],
        "Dendy Cinemas": ["movie 11","movie 22"],
        "Event Cinemas": ["movie 111","movie 222"],
        "Howard Cinemas": ["movie 1111","movie 2222"]]


    //Function to return an array with the name of cinemas (keys)
    func getKeys() -> [String] {
        let cinemasKeys = Array(cinemas.keys)
        return cinemasKeys
    }
    
    //Function to return an array with the name of movies (values)
    func getValues(cinema: String) -> [String] {
        let cinemasValues = cinemas[cinema]
        return cinemasValues!
    }
    
    
}
    /*Cinema(name: "Howard Cinemas"),
    Cinema(name: "Hoyts"),
    Cinema(name: "Independent Exhibitors"),
    Cinema(name: "Palace Cinemas"),
    Cinema(name: "The Movie Masters"),
    Cinema(name: "Reading Cinemas"),
    Cinema(name: "Victa Cinemas")]
    cinemas.append(Cinema(name: "Wallis PORRA!!"))
    //Cinema(name: "Wallis")]
    println(cinemas[0].name)
    
    movies = [Movie(name:"American Sniper"),
    Movie(name:"Annie"),
    Movie(name:"Avengers: Age of Ultron"),
    Movie(name:"Big Eyes"),
    Movie(name:"Big Hero 6"),
    Movie(name:"Birdman"),
    Movie(name:"Chappie"),
    Movie(name:"Cinderella"),
    Movie(name:"Crazy Beautiful You"),
    Movie(name:"Detective K: The Secret Of The Lost Island"),
    Movie(name:"Fast and Furious 7"),
    Movie(name:"Fifty Shades of Grey"),
    Movie(name:"Focus"),
    Movie(name:"Get Hard"),
    Movie(name:"Home 2D"),
    Movie(name:"Inherent Vice"),
    Movie(name:"Jappeloup"),
    Movie(name:"Jupiter Ascending"),
    Movie(name:"Kidnapping Freddy Heineken"),
    Movie(name:"Let Hoi Decide"),
    Movie(name:"Lost and Love"),
    Movie(name:"Manny Lewis"),
    Movie(name:"Mr. Turner"),
    Movie(name:"N.H 10")]
    */
    

/*
case .Cineplex return "Cineplex Australia"
case .Dendy return "Dendy Cinemas"
case .Event return "Event Cinemas"
case .Howard return "Howard Cinemas"
case .Hoyts return "Hoyts"
case .Indpendet return "Independent Exhibitors"
case .Palace return "Palace Cinemas"
case .TheMovieMasters return "The Movie Masters"
case .Reading return "Reading Cinemas"
case .Victa return "Victa Cinemas"
case .Wallis return "Wallis"

<option selected="selected" value="-1">Select movie</option>
<option value="HO00009031">American Sniper</option>
<option value="HO00008903">Annie</option>
<option value="HO00009138">Avengers: Age of Ultron </option>
<option value="HO00008980">Big Eyes</option>
<option value="HO00008925">Big Hero 6</option>
<option value="HO00008963">Birdman</option>
<option value="HO00009101">Chappie</option>
<option value="HO00009106">Cinderella</option>
<option value="HO00009254">Crazy Beautiful You</option>
<option value="HO00009222">Detective K: The Secret Of The Lost Island </option>
<option value="HO00009110">Fast and Furious 7</option>
<option value="HO00008958">Fifty Shades of Grey</option>
<option value="HO00009064">Focus</option>
<option value="HO00009107">Get Hard</option>
<option value="HO00009098">Home 2D</option>
<option value="HO00008969">Inherent Vice</option>
<option value="HO00009104">Insurgent</option>
<option value="HO00009237">Jappeloup</option>
<option value="HO00008692">Jupiter Ascending</option>
<option value="HO00009172">Kidnapping Freddy Heineken</option>
<option value="HO00008862">Kingsman: The Secret Service</option>
<option value="HO00009220">Let Hoi Decide</option>
<option value="HO00009278">Lost and Love</option>
<option value="HO00009066">Manny Lewis</option>
<option value="HO00008806">Mr. Turner</option>
<option value="HO00009227">N.H 10</option>

<option value="HO00008911">Paddington</option>
<option value="HO00008970">Paper Planes</option>
<option value="HO00009045">Project Almanac</option>
<option value="HO00009145">Run All Night</option>
<option value="HO00009123">Selma</option>
<option value="HO00009108">Shaun The Sheep</option>
<option value="HO00008982">Still Alice</option>
<option value="HO00009225">That Sugar Film</option>
<option value="HO00009167">The Banff Mountain Film Festival 2015</option>
<option value="HO00008935">The Imitation Game</option>
<option value="HO00009112">The Longest Ride</option>
<option value="HO00008897">The Penguins of Madagascar</option>
<option value="HO00008974">The Second Best Exotic Marigold Hotel</option>
<option value="HO00008335">The Seventh Son</option>
<option value="HO00008920">The SpongeBob Movie: Sponge Out Of Water</option>
<option value="HO00008979">The Theory of Everything</option>
<option value="HO00009125">Top Five</option>
<option value="HO00009094">Unfinished Business</option>
<option value="HO00009153">UP</option>
*/