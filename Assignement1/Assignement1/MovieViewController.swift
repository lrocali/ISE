//
//  MovieViewController.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 31/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UIPickerViewDelegate {

    var model = Model.sharedInstance
    var chosenCinemaIndex:Int?
    var chosenMovieIndex:Int?
    var chosenSessionIndex:Int?
    var selectedSession:String?
    
    @IBOutlet weak var lblTitleMovie: UILabel!

    @IBOutlet weak var lblGenreMovie: UILabel!
    
    @IBOutlet weak var lblSynopsisMovie: UILabel!

    @IBOutlet weak var imgNameMovie: UIImageView!
 
    @IBOutlet weak var pkrSessionsMovie: UIPickerView!
    
    @IBAction func bookButton(sender: UIButton){
        let alert = UIAlertView()
        alert.title = "Booking details"
        alert.message = "You have booked " + "'" + model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].name  + "'" + " for " + model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].sessions[chosenSessionIndex!].session + " at " +  model.cinemas[chosenCinemaIndex!].name
        alert.addButtonWithTitle("Nice!")
        alert.show()
    }
    
    override func viewDidLoad() {
        
       lblTitleMovie.text = model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].name
        
       lblGenreMovie.text = "Genre: " + model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].genre
        
        lblSynopsisMovie.text = "Synopsis: " + model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].synopsis
        
        imgNameMovie.image = UIImage(named:model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].imageName)
        
        super.viewDidLoad()
        
        //Takes the first item from pickerView
        selectedSession = model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].sessions[0].session
        chosenSessionIndex = 0;
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) ->Int {
        return 1
    }

    func pickerView (pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->Int {
        return model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].sessions.count
    }
    
    func pickerView (pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].sessions[row].session
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        var selectedItem = model.cinemas[chosenCinemaIndex!].movies[chosenMovieIndex!].sessions[row].session
        chosenSessionIndex = row
        selectedSession = selectedItem
    }
        
}
