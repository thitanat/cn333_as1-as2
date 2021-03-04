import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    init(numberOfPairOfCards : Int , cardContentFactory: (Int) -> CardContent) {
        cards = []

        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        cards.shuffle() // shuffle pair of card
    }
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{ cards.indices.filter {cards[$0].isFaceUp }.only }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
        
    }
    
    
    var score : Int = 0
    mutating func choose(card : Card){
        if let chosenIndex = cards.firstIndex(matching: card),
           !cards[chosenIndex].isMatched, !cards[chosenIndex].isFaceUp {
            if cards[chosenIndex].haveFacedUp == true{
                score = score-1
            }

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score = score+2
                    }
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
            cards[chosenIndex].haveFacedUp = true
        }
    }
        
        
        
        
        
        
        struct Card : Identifiable {
        var id = UUID()
        var isFaceUp = false
        var haveFacedUp = false
        var isMatched = false
        var content : CardContent
    }
    
    
    
}
