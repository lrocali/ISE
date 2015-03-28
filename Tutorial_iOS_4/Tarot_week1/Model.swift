//Model Using ENUM


import Foundation

class Model
{
    
    //let majorArcanaCards:[String:MajorArcanaCard]
    var currentCard:MajorArcanaCard = MajorArcanaCard.Fool;
    
    var deckOfCards:DeckOfCards
    
    // Populate the model with a set of Major Arcana Cards
    init()
    {
        deckOfCards = DeckOfCards()
    }
    
    // Return the oracles response to the question posed by the user
    func respond()->String
    {
        // Returns a random integer within the range of indexes for the answers array
        let response: Int = Int(arc4random_uniform(UInt32(deckOfCards.deckOfCards.count)))

        // Set the current card name based on the specified index
        currentCard = Array(deckOfCards.deckOfCards)[response]
        
        return currentCard.interpretation
    }
    
    func description() -> String {
        return currentCard.getCardDescription()
    }
}