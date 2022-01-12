//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jeejio on 2022/1/12.
//

import Foundation

// VIEW MODEL

class EmojiMemoryGame: ObservableObject {
    private static let emojis = [
        "✈️", "🚗", "😈", "🚑", "🧙‍♀️", "🎰", "🎱", "🎲", "🔮", "✨",
        "😀", "😃", "😁", "😄", "😆", "😅", "😂", "🥲", "🤣", "☺️"
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCard: 3) { index in EmojiMemoryGame.emojis[index]}
    }
        
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
