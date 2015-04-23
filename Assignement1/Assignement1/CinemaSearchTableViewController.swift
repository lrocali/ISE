//
//  CinemaSearchTableViewController.swift
//  Assignement1
//
//  Created by Mateus Cirolini on 29/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class CinemaSearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    var model = Model.sharedInstance
    
    var filteredCinemas = [Cinema]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredCinemas.count
        } else {
            return model.cinemas.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cinemaCell", forIndexPath: indexPath) as! UITableViewCell

        var cinema : Cinema
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            cinema = filteredCinemas[indexPath.row]
        } else {
            cinema = self.model.cinemas[indexPath.row]

        }
        
        cell.textLabel!.text = cinema.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredCinemas = self.model.cinemas.filter({( cinema: Cinema) -> Bool in
            let stringMatch = cinema.name.rangeOfString(searchText)
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
        self.performSegueWithIdentifier("cinemaToMovie", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "cinemaToMovie" {
            let cinemaDetailViewController = segue.destinationViewController as! UITableViewController
            if sender as! UITableView == self.searchDisplayController!.searchResultsTableView {
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let destinationTitle = self.filteredCinemas[indexPath.row].name
                cinemaDetailViewController.title = destinationTitle
                
                var chosenCinema = segue.destinationViewController as! MovieSearchTableViewController
                chosenCinema.chosenCinemaIndex = indexPath.row
            } else {
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let destinationTitle = self.model.cinemas[indexPath.row].name
                cinemaDetailViewController.title = destinationTitle
                
                var chosenCinema = segue.destinationViewController as! MovieSearchTableViewController
                chosenCinema.chosenCinemaIndex = indexPath.row
            }
        }
    }
}
