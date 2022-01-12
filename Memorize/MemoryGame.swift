//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jeejio on 2022/1/12.
//

import Foundation

// MODEL

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    // 有几对牌
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        guard let chooseIndx = cards.firstIndex(where: { $0.id == card.id }) else { return }
        cards[chooseIndx].isFaceUp.toggle()
    }
    
    private func index(of card: Card) {
        return
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatch = false
        var content: CardContent
        var id: Int
        
    }
}
