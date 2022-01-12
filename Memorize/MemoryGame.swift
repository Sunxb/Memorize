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
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
    }
    
    
    struct Card {
        var isFaceUp = false
        var isMatch = false
        var content: CardContent
    }
}
