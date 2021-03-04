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
        let emojis = ["🐶","🐱","🐭","🦊","🐻","🐴","🐋","🐮","🐷","🐔","🦐","🐟"]
        let rand = Int.random(in: 4...12) // Random since 4 pair untill 12 pair
        return MemoryGame<String>(numberOfPairOfCards : rand) { emojis[$0] }
    }
    var scorePoint : Int {
        model.score
    }
    

}
