//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jeejio on 2022/1/12.
//

import Foundation

// VIEW MODEL

class EmojiMemoryGame {
    private static let emojis = [
        "✈️", "🚗", "😈", "🚑", "🧙‍♀️", "🎰", "🎱", "🎲", "🔮", "✨",
        "😀", "😃", "😁", "😄", "😆", "😅", "😂", "🥲", "🤣", "☺️"
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCard: 4) { index in EmojiMemoryGame.emojis[index]}
    }
    
    private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
