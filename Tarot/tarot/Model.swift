//
//  Model.swift
//  Tarot
//
//  Created by Lucas Rocali Assuncao Assis on 6/03/2015.
//  Copyright (c) 2015 Lucas Rocali Assuncao Assis. All rights reserved.
//

import Foundation

class Model
{
    let majorArcanaCards:[String:MajorArcanaCard]
    var currentCard:MajorArcanaCard = MajorArcanaCard.Fool
    
    
    
    init()
    {
        //populate with a set of MajorArcanaCards
        majorArcanaCards = MajorArcanaCard.createDeck()
    }

    func respond()->String
    {
        // Returns a random integer within the range of indexes for the answers array
        let response = Int(arc4random_uniform(UInt32(majorArcanaCards.count)))
        
        // Set the current card name based on the specified index
        currentCard = Array(majorArcanaCards.values)[response]
        //println(currentCard)
        return currentCard.interpretation
    }
}

