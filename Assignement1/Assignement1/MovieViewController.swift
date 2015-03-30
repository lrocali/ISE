//
//  MovieViewController.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 31/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate  {

    var model = Model.sharedInstance
    var chosenCinemaIndex:Int?
    var chosenMovieIndex:Int?
    
    @IBOutlet weak var lblTitleMovie: UILabel!

    @IBOutlet weak var lblGenreMovie: UILabel!
    
    @IBOutlet weak var lblSynopsisMovie: UILabel!

    @IBOutlet weak var imgNameMovie: UIImageView!
 
    @IBOutlet weak var pkrSessionsMovie: UIPickerView!
    
    @IBAction func askTheOracle(sender: UIButton)
    {
        println("oi to na sua bunda, IHAAAA")    }
    
    override func viewDidLoad() {
        
       lblTitleMovie.text = model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].name
        
       lblGenreMovie.text = "Genre: " + model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].genre
        
        lblSynopsisMovie.text = "Synopsis: " + model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].synopsis
        
        imgNameMovie.image = UIImage(named:model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].imageName)
        
        super.viewDidLoad()
        
        println("oi to na sua bunda, IHAAAA")
        println(chosenCinemaIndex!)
        println(chosenMovieIndex!)
  
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
