//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tham Thearawiboon on 10/2/2564 BE.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    private(set) var Move: Int
    var emptyIndex = 0
    var WinStatus = ""
    var count = 0
        
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int) -> CardContent) {
        Move = 0
        cards = []
        for Index in 0..<numberOfPairsOfCard {
            let content = cardContentFactory(Index)
            cards.append(Card(id: Index, content: content))
        }
        cards.shuffle()
        for i in 0..<cards.count{
            cards[i].indexCard = i
            if cards[i].id == 15{
                emptyIndex = i
            }
        }
    }
    
    mutating func choose(card: Card){
        let currentCard = card.indexCard
        let emptyCard = emptyIndex
        if currentCard+1==emptyCard && currentCard%4 != 3{
            cards[currentCard] = cards[emptyCard]
            cards[emptyCard] = card
            cards[currentCard].indexCard = currentCard
            cards[emptyCard].indexCard = emptyCard
            emptyIndex = currentCard
            Move+=1
        }
        else if currentCard-1==emptyCard && currentCard%4 != 0{
            cards[currentCard] = cards[emptyCard]
            cards[emptyCard] = card
            cards[currentCard].indexCard = currentCard
            cards[emptyCard].indexCard = emptyCard
            emptyIndex = currentCard
            Move+=1
        }
        else if currentCard-4==emptyCard{
            cards[currentCard] = cards[emptyCard]
            cards[emptyCard] = card
            cards[currentCard].indexCard = currentCard
            cards[emptyCard].indexCard = emptyCard
            emptyIndex = currentCard
            Move+=1
        }
        else if currentCard+4==emptyCard{
            cards[currentCard] = cards[emptyCard]
            cards[emptyCard] = card
            cards[currentCard].indexCard = currentCard
            cards[emptyCard].indexCard = emptyCard
            emptyIndex = currentCard
            Move+=1
        }
        
        for i in 0..<cards.count{
            if cards[i].id == cards[i].indexCard{
                count+=1
            }
            else{
                break
            }
        }
        if count == 16 {
            WinStatus = "Win"
        }
    }
    
    struct Card: Identifiable {
        var id : Int
        var indexCard = 0
        var content: CardContent
    }
    
    func win(card : Card){
        
    }
}
