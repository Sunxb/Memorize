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
                Pie(
                    startAngle: Angle(degrees: 0 - 90),
                    endAngle: Angle(degrees: 100 - 90)
                )
                    .padding(7)
                    .foregroundColor(.red).opacity(0.6)
                
                Text(card.content)
                    .rotationEffect(Angle(degrees: card.isMatch ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstant.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        return min(size.height, size.width) / (DrawingConstant.fontSize / DrawingConstant.fontScale)
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * DrawingConstant.fontScale)
    }
    
    private struct DrawingConstant {
        static let fontScale: CGFloat = 0.5
        static let fontSize: CGFloat = 32
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
