import SwiftUI

class EmojiMemoryGame : ObservableObject {
    @Published private(set) var model : MemoryGame<String> = createMemoryGame()
    
    var cards : Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card : MemoryGame<String>.Card) {
        model.choose(card : card)
    }
    
    static func createMemoryGame() -> MemoryGame<String>
    {
        let emojis = ["👻","🎃","🦇","🕷","🧛‍♂️"]
        let rand = Int.random(in: 2...5) // Random since 2 pair untill 5 pair
        return MemoryGame<String>(numberOfPairOfCards : rand) { emojis[$0] }
    }
    

}
