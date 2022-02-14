# Standford193P
## Day 1( Lectures 1 ~ 4) 
![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)
___
* MVVM DESIGN PATTER 
___
* STRUCTURES AND CLASSES 
* Similarities: 
    *  Pretty much exactly the same syntax 
* Difference between Structs and Class 
  * CLASS : 
      1.  Reference Type
      2.  Passed Around with pointers 
      3.  Object Oriented Programming( Only single inheritence is available) 
      4.  Free Initializers. 
      5.  Always mutabale
      6.  Used in View Model with Observable Object Protocol  when using the MVVM architechture
  * STRUCT: 
      1. Value Types 
      2. Coppies when passed or assigned 
      3. Copy on write 
      4. Functional Programming 
      5. No Inheritence 
      6. Mutability must be explicitely stated

___

* GENERICS: 
  *  We use generics when we dont know what type of data we want to take in. 
  * Arrays are perfect examples. 
    ```Swift
     Struct Array<Element> { 
        func append(_ element: Element) {...}

      }

    ```
  * Array implementation of append knows nothing about the argument and it does not care. Element is not any known struct or class of protocol, it is just a placeholder. 

___

* CLOSURES: 
  * It is so commin to pass functions around that we are very often in lining them. 
  * We call such an inclined function a closure and there is a special language to support for it. 
  * ```Swift
    let payment = { (user: String) -> Bool in
      print("Paying \(user)…")
      return true
      }

    ```
___

## Day 2( Lectures 5) 
![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)
* Access Control 
   * almost every function or var used inside classes should be marked as private or private(set) 
___
* Computed Properties 
   * provided by classes, structures, and enumerations. 
   * Use 
      1. It depends on other properties
      2. You’re defining the property inside an extension
      3. The property is an access point to another object without disclosing it fully
   *  A Computed Property provides a getter and an optional setter to indirectly access other properties and values. It can be used in several ways.
```Swift
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{
            cards.indices.filter({cards[$0].isFacedUp}).oneAndOnly
        }
        set{
            cards.indices.forEach({cards[$0].isFacedUp = ($0 == newValue)})
        }
        
    }

``` 
___
* Extensions 
    * Functionality of an existing class, structure or enumeration type can be added with the help of extensions.  
    * ```Swift
      extension Array{
          var oneAndOnly: Element? {
              if self.count == 1{
                  return self.first
              } else{
                  return nil
              }
          }
      ```
___
* Property Observers 
   * Detect changes in structs willSet and didSet 
   * newValue -> a special variable(the value is going to get set to) 
   * oldValue -> what the value used to be 
   * willSet 
   * didSet 
___ 
* Layout 
   * Hstack, VStack, LazyVStack, LazyHStack, scrollView, LazyHGrid, LazyVGrid, aspectRatio, padding, GoemetryReader, List, Form, OutlineGroup 

___ 
## Day 3(Assignment 2 and  Lectures 5)
![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)
* Protocols
   * almost every function or var used inside classes should be marked as private or private(set) 
___
* @ViewBuilder
    * ViewBuilder is used extensively in SwiftUI to let you create new on-screen views by just listing them out in a trailing closure 
    * It's a property wrapper applied to function parameter
    * ```Swift
      extension Array{
          var oneAndOnly: Element? {
              if self.count == 1{
                  return self.first
              } else{
                  return nil
              }
          }
      ```
___
* @escaping 
   * @escaping is used to inform callers of a function that takes a closure that the closure might be stored or otherwise outlive the scope of the receiving function
   * whenever you have a function that you are passing that  escapes. mark it @escaping. We are holding onto the function.
   * ```Swift
      extension Array{
          var oneAndOnly: Element? {
              if self.count == 1{
                  return self.first
              } else{
                  return nil
              }
          }
      ```
___ 
## Day 4(Lectures 6-8)
![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)
* Implicit Aninamtions 
    * .animation(Animation) 
    * Automatic animation
    * All view modifiers that precede this call will be animated 
    * The changes are modified with duration code 
    * ```Swift
      Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 0.5), value:card.isMatched)
                    .font(font(in: geometry.size))
* Explicit Animations 
    * Explicit Animations are not view modifers.
    * They are functions 
    * Animates the whole content that you are callling
    * ```Swift
      Button("Shuffle"){
                withAnimation{
                    game.shuffle()
                }
            }
* Trasitions
   * Transitions specify how to animate the arrival and departure of Views 
   * Only works for views that are inside CTAAOS 
   *(Containers That Are Already On Screen)    
    * ```Swift
      ForEach(game.cards.filter(isUndealt)){ card in
                cardView(card: card)
                    //.matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of:card))
                
            }
* Animatable Modifier 
   * View Modifier to do Animations 
    * ```Swift
      struct Cardify:AnimatableModifier{
       var isFacedUp: Bool
       var isMatched: Bool
       var rotation: Double //rotation in degrees

       var animatableData: Double{
           get{rotation}
           set{rotation = newValue}
       }
    
* matchedGeometryEffect and @NameSpace
   * Sometimes you want a view to move from one place of the screen to another 
   * If the view is moving to a new place in its same container, this is no problem
   * Moving like this is just animating the .position ViewModifier arguments
   * This kind of thing happens automatically when you explicitly animate 
   * ```Swift
     struct EmojiMemoryGameView: View {
          @ObservedObject var game: emojiMemoryGame
          @Namespace private var dealingNameSpace
          
           ForEach(game.cards.filter(isUndealt)){ card in
                cardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of:card))
                
            }
            
* Using onAppear for geometry 
   * use when you want to animate a view when it first appears on screen use .onAppar.  
   * ```Swift
      Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animatedBonusRemaing)*360-90))
       .onAppear {
           animatedBonusRemaing = card.bonusRemaining
           withAnimation(.linear(duration: card.bonusTimeRemaining)) {
               animatedBonusRemaing = 0
           }
       }

