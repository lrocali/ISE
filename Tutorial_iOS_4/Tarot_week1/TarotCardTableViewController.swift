//
//  TarotCardTableViewController.swift
//  tarot_week1
//
//  Created by Mateus Cirolini on 28/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class TarotCardTableViewController: UITableViewController {

    var tarot = Model().deckOfCards
    
    override func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int
    {
        return tarot.deckOfCards.count;
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
