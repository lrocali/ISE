import Foundation

struct DeckOfCards
{
    var deckOfCards:[MajorArcanaCard]
    var tabledCards:[MajorArcanaCard]
    
    init ()
    {
        
        deckOfCards = MajorArcanaCard.getDeck()
        tabledCards = [MajorArcanaCard]()
        
        shuffle()
        
        tableACard()
        
        putCardsBackInDeck()
    }
    
    mutating func tableACard()
    {
        let card = deckOfCards.removeAtIndex(0)
        tabledCards.append(card)
    }
    
    mutating func shuffle()
    {
        // Perform the swap operation equal to the number of cards in the deck
        for currentCardIndex in 0..<deckOfCards.count
        {
            // Random number between 0 and the number of cards in deck
            let randomCardIndex = Int(arc4random_uniform(UInt32(deckOfCards.count)))
            
            // Check that we are not swapping a card with itself
            if randomCardIndex != currentCardIndex
            {
                // Swap the current card with a random card
                swap(&deckOfCards[currentCardIndex], &deckOfCards[randomCardIndex])
            }
        }
    }
    
    mutating func putCardsBackInDeck()
    {
        for card in 0..<tabledCards.count
        {
            // Remove card from top of tabled cards
            let card = tabledCards.removeAtIndex(card)
            
            // Random number between 0 and the number of cards in deck
            let randomCardIndex = Int(arc4random_uniform(UInt32(deckOfCards.count)))
            
            // Insert card back into deck of cards at random position
            deckOfCards.insert(card, atIndex: randomCardIndex)
        }
    }
}