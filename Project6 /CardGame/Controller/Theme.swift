//
//  Theme.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/08.
//

import Foundation

//Create different themes for the game. Called in View Contoller 
struct Theme{
    var name:String
    var emojis: Array<String>
    var numberOfPairsToShow : Int
    var color:String
    
    init(name:String, emojis: Array<String>, numberOfPairsToShow: Int, color: String){
        self.name = name
        self.emojis = emojis
        self.numberOfPairsToShow = numberOfPairsToShow > emojis.count ? emojis.count : numberOfPairsToShow
        self.color = color
    }
}
