//
//  ContentView.swift
//  Memorize
//
//  Created by Jeejio on 2022/1/11.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                if card.isMatch && !card.isFaceUp {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card)
                        .padding(4)
                        .onTapGesture {
                            game.choose(card)
                    }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstant.cornerRadius)
                if card.isFaceUp {
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: DrawingConstant.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatch {
                    shape.opacity(DrawingConstant.opacity)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * DrawingConstant.fontScale)
    }
    
    struct DrawingConstant {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let opacity: Double = 0.0
        static let fontScale: CGFloat = 0.55
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
