//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jeejio on 2022/1/11.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
