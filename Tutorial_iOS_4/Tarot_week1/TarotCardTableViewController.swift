//
//  TarotCardTableViewController.swift
//  tarot_week1
//
//  Created by Mateus Cirolini on 28/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class TarotCardTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    var tarot = Model.sharedInstance.deckOfCards
    
    var filteredTarotCards:[MajorArcanaCard] = []
    
    func filterContentForSearchText(searchText:String){
        self.filteredTarotCards = tarot.deckOfCards.filter({
                (card: MajorArcanaCard) -> Bool in
                let nameMatch = (searchText == "All")
                ||
                (card.name.lowercaseString.rangeOfString(searchText.lowercaseString) != nil)
                return nameMatch
            }
        )
    }
    
    func searchDisplayController(controller:UISearchDisplayController!, shouldReloadTableForSearchString searchString:String!) -> Bool{
        self.filterContentForSearchText(searchString)
        
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int
    {
        if tableView == self.searchDisplayController!.searchResultsTableView{
            return self.filteredTarotCards.count
        }
        else{
            return tarot.deckOfCards.count
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("tarotCardDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        if segue.identifier == "tarotCardDetail" {
            let tarotCardDetailViewController =
            segue.destinationViewController as UIViewController
            
            if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                
                let destinationTitle = self.filteredTarotCards[indexPath.row].name
                
                tarotCardDetailViewController.title = destinationTitle
                
                var detailsVC = segue.destinationViewController as TarotDetailViewController
                detailsVC.cardName = destinationTitle;
            }
                
            else {
                let indexPath = self.tableView.indexPathForSelectedRow()!
        
                let destinationTitle = self.tarot.deckOfCards[indexPath.row].imageName
                
                tarotCardDetailViewController.title = destinationTitle
        
                var detailsVC = segue.destinationViewController as TarotDetailViewController
                
                detailsVC.cardName = destinationTitle;
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as
        UITableViewCell
        
        var card:MajorArcanaCard
        //
        if tableView == self.searchDisplayController!.searchResultsTableView{
            card = filteredTarotCards[indexPath.row]
        }
        else{
            card = tarot.deckOfCards[indexPath.row]
        }
        
        //
        cell.textLabel!.text = card.name
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }    
}
