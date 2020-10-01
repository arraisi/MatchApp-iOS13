//
//  CardModel.swift
//  MatchApp
//
//  Created by Abdul R. Arraisi on 26/09/20.
//

import Foundation

class CardModel {
    
    func getCards () -> [Card] {
        
        // Declare an empty Array
        var generatedCard = [Card]()
        
        // Randomly generate 8 pairs of cards
        for _ in 1...8 {
            
            let randomNumber = Int.random(in: 1...13)
            
            let cardOne = Card()
            let cardTwo = Card()
            
            cardOne.cardName = "card\(randomNumber)"
            cardTwo.cardName = "card\(randomNumber)"
            
            generatedCard += [cardOne, cardTwo]
        }
        
        // Randomize card within the array
        generatedCard.shuffle()
        
        // return the array
        return generatedCard
    }
    
}
