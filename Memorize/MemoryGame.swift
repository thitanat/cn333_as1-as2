import Foundation

struct MemoryGame<CardContent> {
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
    mutating func choose(card : Card) {
        let choosenIndex = index(of : card)
        cards[choosenIndex].isFaceUp = !cards[choosenIndex].isFaceUp
        print("card choosen :  \(card)")
    }
    
    func index(of : Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == of.id {
                return index
            }
        }
        return -1
    }
    struct Card : Identifiable {
        var id = UUID()
        var isFaceUp = false
        var Matched = false
        var content : CardContent
    }

    
}
