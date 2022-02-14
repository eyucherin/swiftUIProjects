//
//  Caridfy.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/10.
//

import SwiftUI

struct Cardify:AnimatableModifier{
    var isFacedUp: Bool
    var isMatched: Bool
    var rotation: Double //rotation in degrees
    
    var animatableData: Double{
        get{rotation}
        set{rotation = newValue}
    }
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
    }
    
    init(isFaceUp: Bool, isMatched: Bool){
        self.isFacedUp = isFaceUp
        self.isMatched = isMatched
        self.rotation = isFaceUp ? 0 : 180
    }
 
    func body(content: Content) -> some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius:DrawingConstants.cornerRadius)
            if rotation<90{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth:DrawingConstants.lineWidth)
                //content
            
            }else if(isMatched){
                shape.opacity(0)
                
            }else{
                shape.fill()
                
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
        
    }
}

extension View{
    func cardify(isFacedUp:Bool, isMatched: Bool) -> some View{
        return self.modifier(Cardify(isFaceUp: isFacedUp, isMatched: isMatched))
    }
}
