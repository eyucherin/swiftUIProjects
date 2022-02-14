//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/05.
//

import Foundation
import SwiftUI
//GATEKEEPER : Protect the model from ill behaving views.



class emojiMemoryGame:ObservableObject{
    
    //Making our model private
    //only view model can access
    //ACCESS CONTROL
    
    /*
    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfCards: 4, createCardOfType: { (index: Int) -> String in
        return "😌"
    })
     */
    
    init(){
        theme = Self.themes.randomElement()!
        theme.emojis.shuffle()
        model = Self.createGame(theme: theme)
    }
    

    //static let food2  = ["🍏","🍐","🍌"]
    typealias Card = MemoryGame<String>.Card
    
    static var themes:Array<Theme> = [
        Theme(name: "Food", emojis: ["🍏","🍐","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥔","🍠","🥐","🥯","🥨","🧀","🥚","🍳","🥞","🧇","🥩","🍗","🍖","🍔","🍟","🍕","🥪","🥙","🌮","🌯","🥗","🍛","🍲","🍜","🍣","🍱","🥟","🍘","🍥","🍙","🍤","🍚","🍢","🍡","🍧","🍨","🍦","🍰","🎂","🍭","🍫","🍬","🌰","🍯"], numberOfPairsToShow: 5, color: "red"),
        Theme(name: "Animals", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🐔","🐧","🐦","🐤","🐣"], numberOfPairsToShow: 10, color: "green"),
        Theme(name: "Clothing", emojis: ["🧥","🥼","🦺","👚","👕","👖","🩲","🩳","👔","👗","🩱","👘","🥻","🩴","🥿","👠","👡","👢","👞","👟","🧤","🧦","🥾","🧣","🎩","🧢","👒","⛑","🪖","👑","👛","👜","💼","🕶","🥽"], numberOfPairsToShow: 12, color: "blue"),
        Theme(name: "Occupation", emojis: ["👮‍♀️","👷‍♀️","💂‍♀️","🕵️‍♀️","👩‍⚕️","👩‍🌾","👩‍🍳","👩‍🎓","👩‍🎤","👩‍🏫","👩‍🏭","👩🏻‍💻","🧑‍🔧","👩‍🔬","👩‍🎨","👩‍🚒","👩‍✈️","👩‍⚖️","👸","🤴","🦹‍♀️","🤶","🧙‍♀️"], numberOfPairsToShow: 8, color: "yellow"),
        Theme(name: "Vehicles", emojis: ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🦽","🦼","🛴","🚲","🛵","🏍","🛺","🚔","🚍","🚟","🚠","🚡","🚞","🚝","🚅","🚆","🚇","✈️","🛫","🛬","🛩","💺","🚀","🛸","🚁","⛵️","🛶","🛥","🛳","🚢"], numberOfPairsToShow: 11, color: "orange")
   
        ]
    
    
    
    
    private static func createGame(theme:Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfCards: theme.numberOfPairsToShow){
            index in theme.emojis[index]
            //index in food2[index < food2.count ? index : Int.random(in: food2.indices) ]
        }
    }
    
    @Published var model: MemoryGame<String>
    private var theme: Theme
    
    var themeName: String{
        return theme.name
    }
    
    var themeColor:Color{
        switch theme.color{
        case "red":
            return .red
        case "blue":
            return .blue
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "green":
            return .green
        default:
            return .white
        }
    }
    
    var getScore:Int{
        return model.score
    }
    
    var cards: Array<Card>{
        return model.cards
    }
    
    func choose(card:Card){
        model.Choose(card)
    }
    
    
    func newGame(){
        theme = Self.themes.randomElement()!
        theme.emojis.shuffle()
        model = Self.createGame(theme: theme)
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func restart(){
        model = emojiMemoryGame.createGame(theme: theme)
    }
    
  
    
}
