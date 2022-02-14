# Project 5

![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)

* learned to create a tab view from scratch, functional programming, geometry reader, and using enumerations 
* More information regarding Project4 [here](https://github.com/eyucherin/swiftUIProjects/tree/main/Project4)

<p align="left">
<img src="https://user-images.githubusercontent.com/66363530/153877891-750d93ff-b9f7-482d-ab17-c383bbc1442e.gif" width="220" height="450" border="10"/>
</p>

# NOTES 
## 1. Functional Programming 
  * functional programming
  *  It is a declarative type of programming style
  *  Its main focus is on “what to solve” in contrast to an imperative style where the main focus is “how to solve”
  *  It uses expressions instead of statements
```Swift
    func changeIconColor(tabIndex : TabIndex) -> Color{
        switch tabIndex {
        case .home:
           return  Color.red
        case .listen:
            return Color.blue
        case .record:
            return Color.green
        }
    }
    
    Image(systemName: "house")
        .foregroundColor(self.tabIndex == .home ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
     
```


## 2. Geometry Reader 
  * A container view that defines its content as a function of its own size and coordinate space.
  * To solve this, GeometryReader provides us with an input value telling us the width and height we have available, and we can then use that with whatever calculations we need.
```Swift
GeometryReader { geometry in
    HStack(spacing: 0) {
        Text("Left")
            .font(.largeTitle)
            .foregroundColor(.black)
            .frame(width: geometry.size.width * 0.33)
            .background(Color.yellow)
        Text("Right")
            .font(.largeTitle)
            .foregroundColor(.black)
            .frame(width: geometry.size.width * 0.67)
            .background(Color.orange)
    }
}
.frame(height: 50)
     
```
## 3. Enumerations 
  * a common type for a group of related values and enables you to work with those values in a type-safe way within your code
  * The values of the constants are values of an integral type known as the underlying type of the enumeration.
```Swift
enum TabIndex{
    case home,listen,record
}

struct CustomTabView: View {
   
    @State var tabIndex: TabIndex
    @State var largerScale: CGFloat = 1.3
 }
     
```
