//
//  CardGameApp.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/05.
//

import SwiftUI

@main
struct CardGameApp: App {
    private let game = emojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
