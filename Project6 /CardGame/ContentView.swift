//
//  ContentView.swift
//  CardGame
//
//  Created by Elizabeth Yu on 2022/02/05.
//

import SwiftUI

//View of One Card
struct cardView: View{
    let card : emojiMemoryGame.Card
    @State var animatedBonusRemaing: Double = 0
    var body: some View{
        GeometryReader(content: {geometry in
            ZStack{
                Group{
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animatedBonusRemaing)*360-90))
                            .onAppear {
                                animatedBonusRemaing = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusRemaing = 0
                                }
                            }
                    } else {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-card.bonusRemaining)*360-90))
                    }
                    
                }
                .padding(DrawingConstants.circlePadding)
                .opacity(DrawingConstants.circleOpacity)
    
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 0.5), value:card.isMatched)
                    .font(font(in: geometry.size))
                    
            }
            // this is the same as .modifier(Cardify(isFaceUp: card.isFaceUp))
            // it turns our ZStack with a Pie and a Text in it into a "card" on screen
            // it does this by just returning its own ZStack with RoundedRectangles and such in it
            // see Cardify.swift
            .cardify(isFacedUp: card.isFacedUp, isMatched: card.isMatched)
        })
    }
    
    private func font(in size : CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.scale)
    }
     
    private struct DrawingConstants{
        static let scale: CGFloat = 0.70
        static let circlePadding: CGFloat = 5
        static let circleOpacity: CGFloat = 0.5
    }
}


struct EmojiMemoryGameView: View {
    @ObservedObject var game: emojiMemoryGame
    @Namespace private var dealingNameSpace
    @State private var dealt = Set<UUID>()
    
    private func dealCard(_ card :emojiMemoryGame.Card){
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: emojiMemoryGame.Card) -> Bool{
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: emojiMemoryGame.Card) -> Animation{
        var delay = 0.0
        if let index = game.cards.firstIndex(where: {$0.id == card.id}){
            delay = Double(index) * CardConstants.totalDealDuration / Double(game.cards.count)
        }
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
        
    }
    private func zIndex(of card: emojiMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where:{$0.id == card.id}) ?? 0)
    }
    
    var titleAndScore : some View{
        HStack {
            Text(game.themeName).font(.largeTitle)
            Spacer()
            Text("Score: \(game.getScore)").font(.largeTitle)
        }
        .padding()
    }
    

    
    var shuffleChangeRestart: some View{
        HStack{
            Button("New Game") {
                game.newGame()
            }
            Spacer()
            
            Button("Shuffle"){
                withAnimation{
                    game.shuffle()
                }
            }
            Spacer()
           
            
            Button("Restart"){
                withAnimation{
                    dealt = []
                    game.restart()
                }
            }
            
        }
        .font(.title)
        .padding(.horizontal)
        
        
    }
    var gameBody : some View{
        AspectVGrid(items: game.cards, aspectRatio: CardConstants.aspectRatio , content: { card in
            if isUndealt(card){
                Color.clear
            }else{
                cardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .opacity))
                    .zIndex(zIndex(of:card))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.7)){
                            self.game.choose(card: card)
                        }
                    }
            }

        })
            .foregroundColor(game.themeColor)
            .padding(.horizontal)
        
    }
    
    
    var deckBody: some View{
        ZStack{
            ForEach(game.cards.filter(isUndealt)){ card in
                cardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of:card))
                
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(game.themeColor)
        .onTapGesture {
            for card in game.cards{
                withAnimation(dealAnimation(for: card)){
                        dealCard(card)
                    }
                }
        }

    }
    
    private struct CardConstants {
        static let aspectRatio:CGFloat = 2/3
        static let undealtWidth:CGFloat = undealtHeight * aspectRatio
        static let undealtHeight:CGFloat = 90
        static let totalDealDuration: Double = 2
        static let dealDuration: Double = 0.5
    }
    
    
    var body: some View {
        VStack{
            titleAndScore
            ZStack(alignment: .bottom){
                gameBody
                deckBody
            }
            shuffleChangeRestart
            
        }
        
       
    }
}

struct emojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = emojiMemoryGame()
//      game.choose(card: game.cards.first!)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.dark)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
    }
}
