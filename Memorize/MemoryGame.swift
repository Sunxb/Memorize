//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jeejio on 2022/1/12.
//

import Foundation

// MODEL

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    private var selectedIndex: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue) }) }
    }
    
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
        if cards[chooseIndx].isFaceUp || cards[chooseIndx].isMatch { return }
        
        if let index = selectedIndex {
            if cards[index].content == cards[chooseIndx].content {
               cards[index].isMatch = true
               cards[chooseIndx].isMatch = true
            }
            // 当前选择的必须朝上
            cards[chooseIndx].isFaceUp = true
        } else {
            selectedIndex = chooseIndx
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatch = false
        var content: CardContent
        var id: Int
        
    }
}

extension Array {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
