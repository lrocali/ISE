//
//  MovieTableViewController.swift
//  Cinema
//
//  Created by Rocali on 19/03/2015.
//  Copyright (c) 2015 Rocali. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    //Creating the model to access the data
    var model = Model()
    
    //Creating an array for the name of movies
    var moviesName:[String] = []
    
    //Name of the cinema chosen
    var cinemaName:String = ""
    
    //Auxiliar array when the user search for a movie
    var filteredMovies:[String] = []
    
    override func viewDidLoad() {
        
        //Getting the name of the cinema chosen (the same of the title)
        cinemaName = self.title!
        
        //Getting the array of movies name by the name of the cinema
        moviesName = model.getValues(cinemaName)
        
        self.tableView.reloadData()
    }
    
    //Function to get the number of cells in the table view, by the normal or the sarch mode
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredMovies.count
        } else {
            return self.moviesName.count
        }
    }
    
    //Function to get the names of the cells in the table view, by the normal or the sarch mode
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("movieCell") as UITableViewCell
        
        var movie: String
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            movie = filteredMovies[indexPath.row]
        } else {
            movie = moviesName[indexPath.row]
        }
        cell.textLabel!.text = movie
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
     //Function to filter
    func filterContentForSearchText(searchText: String) {
        self.filteredMovies = self.moviesName.filter({( movie: String) -> Bool in
            let stringMatch = movie.rangeOfString(searchText)
            return (stringMatch != nil)
        })
    }
    
    //Function to search
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    //Function to search
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    //Function to segue
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("movieDetail", sender: tableView)
    }
    
    //Function to search
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "movieDetail" {
            
            //Crate a variable for the next view controller
            let movieDetailViewController = segue.destinationViewController as UIViewController
            
            //If is by the search mode
            if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                
                 //Number of the cell chosen
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                
                //Put the name of the cell in the title of the next controller
                let destinationTitle = self.filteredMovies[indexPath.row]
                movieDetailViewController.title = destinationTitle
            } else {
                
                 //Number of the cell chosen
                let indexPath = self.tableView.indexPathForSelectedRow()!
                
                //Put the name of the cell in the title of the next controller
                let destinationTitle = self.moviesName[indexPath.row]
                movieDetailViewController.title = destinationTitle
            }
        }
    }
}
