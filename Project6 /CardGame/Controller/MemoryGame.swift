//
//  MemoryGame.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/05.
//

import Foundation

//Create the logic for memory game called in View Controller
struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var score: Int = 0
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{
            cards.indices.filter({cards[$0].isFacedUp}).oneAndOnly
        }
        set{
            cards.indices.forEach({cards[$0].isFacedUp = ($0 == newValue)})
        }
        
    }
    
    //Puts two if wach card in the card array and shuffles them.
    init(numberOfCards:Int, createCardOfType:(Int) -> CardContent){
        cards = []
        for i in 0..<numberOfCards{
            let userContent = createCardOfType(i)
            cards.append(Card(content: userContent))
            cards.append(Card(content: userContent))
        }
        cards.shuffle()
    }
    
    //If the card is not faced up and not matched mark the selected index as chosenIndex.
    //
    mutating func Choose (_ card: Card){
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFacedUp,
            !cards[chosenIndex].isMatched
        {
            //If we already have a card that is faced up, that card will be the potential Match which is the index of the previously chosen card. Chosen Index is now the newly chosen card.
            // The current count of cards[$0].isFacedUp should be 1.
            if let potentialMatch = indexOfTheOneAndOnlyFaceUpCard {
                //If their contents are the same they are matched and you get 2+ points
                if cards[chosenIndex].content == cards[potentialMatch].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                    score += 2
                // If their contents are not the same and have been seen, -1 for each
                }else{
                    if cards[potentialMatch].hasAlreadyBeenSeen || cards[chosenIndex].hasAlreadyBeenSeen{
                        score -= 1
                    }
                }
                //card of current chosen index is true
                cards[chosenIndex].isFacedUp = true
                
             // When oneAndOnly nil so when number of face up card is not 1 . Flip all face up cards and set them to already been seen
            }else{
                for index in cards.indices{
                    if cards[index].isFacedUp{
                        cards[index].isFacedUp = false
                        cards[index].hasAlreadyBeenSeen = true
                    }
                }
                // When no cards are faced up then selected card is the indexOfTheOneAndOnlyFaceUpCard
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    

    struct Card:Identifiable{
        let id = UUID()
        var isFacedUp = false {
            didSet {
                if isFacedUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        var isMatched: Bool = false{
            didSet{
                stopUsingBonusTime()
            }
        }
        var hasAlreadyBeenSeen = false
        let content: CardContent
            
            
        // MARK: - Bonus Time
        
        // this could give matching bonus points
        // if the user matches the card
        // before a certain amount of time passes during which the card is face up
        
        // can be zero which means "no bonus available" for this card
        var bonusTimeLimit: TimeInterval = 6
        
        // how long this card has ever been face up
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        // the last time this card was turned face up (and is still face up)
        var lastFaceUpDate: Date?
        // the accumulated time this card has been face up in the past
        // (i.e. not including the current time it's been face up if it is currently so)
        var pastFaceUpTime: TimeInterval = 0
        
        // how much time left before the bonus opportunity runs out
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        // percentage of the bonus time remaining
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        // whether the card was matched during the bonus time period
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        // whether we are currently face up, unmatched and have not yet used up the bonus window
        var isConsumingBonusTime: Bool {
            isFacedUp && !isMatched && bonusTimeRemaining > 0
        }
        
        // called when the card transitions to face up state
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        // called when the card goes back face down (or gets matched)
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        }
    }
    
    
    
}
extension Array{
    var oneAndOnly: Element? {
        if self.count == 1{
            return self.first
        } else{
            return nil
        }
    }
}
