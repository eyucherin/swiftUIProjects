# Project 7

![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)
* Learned how to use menu , picker, and multitrailing closures. 
* More information regarding Project7 [here](https://github.com/eyucherin/swiftUIProjects/tree/main/Project6%20)

<p align="left">
<img src="https://user-images.githubusercontent.com/66363530/154680358-6867d458-b38f-4812-890f-a6506ec8533d.gif" width="220" height="450" border="10"/>
</p>

# NOTES 
## 1. menu
  * used as a type of toolbar item but can also be used as buttons. 
  * A menu can be called inside a menu. 
  * The main reason to use brand new menus is disambiguation. It allows us to provide additional context around your primary action. 
  * SwiftUI gives us a dedicated view for showing popup menus from buttons, helpfully called Menu.
  * label is optional 
  
```Swift
     Menu("Options") {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
            Menu("Advanced") {
                Button("Rename", action: rename)
                Button("Delay", action: delay)
            }
            Button("Cancel", action: cancelOrder)
        }
     
```
## 2. picker
  * If we do not specify the picker style the defualt will be a button. 
  * When tapped, a menu with the rest of the options pops up. 

```Swift
    let myFood =  ["Taco 🌮", "Pizza 🍕", "Dumpling 🥟"]
    
    Picker(selection: $selected,
           label: Text("Pick Food")){
        ForEach(myFood.indices,
                id: \.self,
                content: { index in
            Text("\(myFood[index])").tag(index)
        })
    }
     
```
## 3. multitrailing closures. 
  * When there is a closure or multiple closures in a closure. 
```Swift
   Menu("Empty Tasks") {
        Button {
        } label : {
            Label("Empty Task1" , systemImage: "rectangle.and.pencil.and.ellipsis")
        }
        Button {
        } label : {
            Label("Empty Task2" , systemImage: "pencil.and.outline")
        }
    }
     
```



