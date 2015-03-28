//
//  TarotCardTableViewController.swift
//  tarot_week1
//
//  Created by Mateus Cirolini on 28/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class TarotCardTableViewController: UITableViewController {

    var tarot = Model.sharedInstance.deckOfCards
    
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int
    {
        return tarot.deckOfCards.count;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("tarotCardDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        let tarotCardDetailViewController =
        segue.destinationViewController as UIViewController
        let indexPath = self.tableView.indexPathForSelectedRow()!
        let destinationTitle = self.tarot.deckOfCards[indexPath.row].imageName
        tarotCardDetailViewController.title = destinationTitle
        var detailsVC = segue.destinationViewController as TarotDetailViewController
        detailsVC.cardName = destinationTitle;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as
        UITableViewCell
        
        var card:MajorArcanaCard
        
        card = tarot.deckOfCards[indexPath.row]
        
        cell.textLabel!.text = card.name
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }    
}
