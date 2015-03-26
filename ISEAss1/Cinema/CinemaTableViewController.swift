//
//  CinemaTableViewController.swift
//  Cinema
//
//  Created by Rocali on 19/03/2015.
//  Copyright (c) 2015 Rocali. All rights reserved.
//

import UIKit

class CinemaTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    //Creating the model to access the data
    let model = Model()
    
    //Creating an array for the name of cinemas
    var cinemasName:[String] = []
    
    //Auxiliar array when the user search for a cinema
    var filteredCinemas:[String] = []
    
    override func viewDidLoad() {
        
        //Populating the arrray with the name of cinemas
        cinemasName = model.getKeys()

        self.tableView.reloadData()
    }
    
    //Function to get the number of cells in the table view, by the normal or the sarch mode
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredCinemas.count
        } else {
            return self.cinemasName.count
        }
    }
    
    //Function to get the names of the cells in the table view, by the normal or the sarch mode
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cinemaCell") as UITableViewCell
        
        var cinema = ""
        
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            cinema = filteredCinemas[indexPath.row]
        } else {
            cinema = cinemasName[indexPath.row]
        }
        
        cell.textLabel!.text = cinema
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    //Function to filter
    func filterContentForSearchText(searchText: String) {
        self.filteredCinemas = self.cinemasName.filter({( cinema: String) -> Bool in
            let stringMatch = cinema.rangeOfString(searchText)
            return (stringMatch != nil)
        })
    }
    
    //Function to search
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchCinema: String!) -> Bool {
        self.filterContentForSearchText(searchCinema)
        return true
    }
    
    //Function to search
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    //Function to the segue
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("cinemaDetail", sender: tableView)
    }
    
    //Function to the segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "cinemaDetail" {
            
            //Crate a variable for the next view controller
            let cinemaDetailViewController = segue.destinationViewController as UIViewController
            
            //If is by the search mode
            if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                
                //Number of the cell chosen
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                
                //Put the name of the cell in the title of the next controller
                let destinationTitle = self.filteredCinemas[indexPath.row]
                cinemaDetailViewController.title = destinationTitle
            } else {
                
                 //Number of the cell chosen
                let indexPath = self.tableView.indexPathForSelectedRow()!
                
                 //Put the name of the cell in the title of the next controller
                let destinationTitle = self.cinemasName[indexPath.row]
                cinemaDetailViewController.title = destinationTitle
            }
        }
    }
}