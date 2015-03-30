//
//  MovieSearchTableViewController.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 30/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate  {

    var model = Model.sharedInstance
    
    var chosenCinemaIndex:Int?
    
    var filteredMovies = [Movie]()
    
    
    override func viewDidLoad() {
        //println("oi to na movue controller")
        //println(chosenCinemaIndex!)
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredMovies.count
        }
        
        else {
            return self.model.cinemas[chosenCinemaIndex!].movies.count
        }
        //return self.model.cinemas[chosenCinemaIndex!].movies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as UITableViewCell
        
        var movie : Movie
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            movie = filteredMovies[indexPath.row]
        }
        
        else {
            movie = self.model.cinemas[chosenCinemaIndex!].movies[indexPath.row]
            
        }
        
        cell.textLabel!.text = movie.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredMovies = self.model.cinemas[chosenCinemaIndex!].movies.filter({( movie: Movie) -> Bool in
            let stringMatch = movie.name.rangeOfString(searchText)
            return (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("movieToDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "movieToDetail" {
            let movieDetailViewController = segue.destinationViewController as UIViewController
            if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let destinationTitle = self.filteredMovies[indexPath.row].name
                movieDetailViewController.title = destinationTitle
                
                var chosenMovie = segue.destinationViewController as MovieViewController
                chosenMovie.chosenMovieIndex = indexPath.row
                chosenMovie.chosenCinemaIndex = chosenCinemaIndex
            }
            else {
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let destinationTitle = self.model.cinemas[chosenCinemaIndex!].movies[indexPath.row].name
                movieDetailViewController.title = destinationTitle
                
                var chosenMovie = segue.destinationViewController as MovieViewController
                chosenMovie.chosenMovieIndex = indexPath.row
                chosenMovie.chosenCinemaIndex = chosenCinemaIndex
            }
        }
    }
}
