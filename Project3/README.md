# Project 3

![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)

* Learned to use Alert, Buttons, EditButton(onDelete,onMove),Form,List, @Environment Variables, and lazyVGrids.

<p align="left">
<img src="https://user-images.githubusercontent.com/66363530/151584522-af8d50bc-c38e-43b8-94de-2693fcf1ca5f.gif" width="220" height="450" border="10"/>
</p>

# NOTES 

## 1. Alert
* usually used with Buttons. 
* define a @State variable that determines whether the alert should be on or off 
* `.alert(isPresented :$BOOLEAN){//call Alert here }` 
* Add Primary or Secondary Buttons 
* button types: `.destctive`, `.secondary`


```Swift
import SwiftUI

struct ImageView: View {
    @State var showDetails: Bool = false 
    var body: some View {    
            Button(action: {
                print("Click Button")
                self.showDetails.toggle()
                //Toggle from false to true
                print("show detail \(self.showDetails)")
            }, label: {
                Text("Confirm")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(30)
            })
                .alert(isPresented: $showDetails){
                    Alert(title: Text("TITLE"),
                          message: nil,
                          primaryButton: .destructive(Text("CANCEL")),
                          secondaryButton: .default(Text("OKAY"))
                    )
                    //Changes showDetail to false once completed
            }
        
    }
}
```

## 2.List
* List Iteration
    1. Range: `List(0...100,id:\.self){}`
    2. Random Access Collection: `List([1,2,3,4,5,6,7],id:\.self){}`
    3. Identifiable Protocol: `List(ghilbi){}`
        ```Swift
        import SwiftUI
        struct Ghibli : Identifiable {
              let name:String()
              led id = UUID()
        }

        private var values = [
                            Ghibli(name: "A"),
                            Ghibli(name: "B"),
                            Ghibli(name: "C"),
                            Ghibli(name: "D"),
                            Ghibli(name: "E"),
                            Ghibli(name: "F")

        ]

        ```
     4. ForEach 
        ```Swift
        List {
        ForEach(0..<30) {
        Text("\($0)")
           }
        }

        ```
* Create Headers and Footers `Section(header:Text(""),footer:Text("")`

```Swift
        List {
         Section(header:Text("Section1"),footer:Text("blahblah"){
              ForEach(0..<30) {
                  Text("\($0)")
             }
          }
        }
```
* Row Insets: Used to custatimize padding for each row , call after section
`.listRowInsets(EdgeInsets.init(top:4, leading: 4, bottom: 4, trailing: 4))`

## 3.EditButton(onDelete,onMove)
* Used to edit List 
* only available when you have a seperate list.
* add `.navigationBarItems(trailing: EditButton())` or `toolbar{EditButton()}` to add editing actions
* create seperate deleteList function and call after iteration 
```Swift
     func removeList1(at offset: IndexSet){
        self.section1Task.remove(atOffsets: offset)
    }
```
* create sepererate moveList function and call after iteration 
```Swift
    func moveList1(from source: IndexSet, to destination: Int) {
        self.section1Task.move(fromOffsets: source, toOffset: destination)
    }
```

```Swift
import SwiftUI

struct navigationView1: View {
     @State var section2Task = [
        myCard(icon: "pencil.tip.crop.circle", title: "Task 1", start: 2, end: 3, backgroundColor: Color.orange),
        myCard(icon: "pencil.tip.crop.circle", title: "Task 2", start: 2, end: 3, backgroundColor: Color.yellow),
        myCard(icon: "pencil.tip.crop.circle", title: "Task 3", start: 2, end: 3, backgroundColor: Color.red),
        myCard(icon: "pencil.tip.crop.circle", title: "Task 4", start: 2, end: 3, backgroundColor: Color.pink),
        myCard(icon: "pencil.tip.crop.circle", title: "Task 5", start: 2, end: 3, backgroundColor: Color.blue)
    ]

       var body: some View {
        List{
            Section(header:Text("Section1")){
                ForEach(0...self.section1Task.count - 1,id:\.self){item in
                    self.section1Task[item]
                }
                .onDelete(perform: removeList1)
                .onMove(perform: moveList1)
            }
            
            .listRowInsets(EdgeInsets.init(top:4, leading: 4, bottom: 4, trailing: 4))
            Section(header:Text("Section2")){
                ForEach(0...self.section1Task.count - 1,id:\.self){item in
                    self.section2Task[item]
                }
                .onDelete(perform: removeList2)
                .onMove(perform: moveList2)
                
            }
            .listRowInsets(EdgeInsets.init(top:4, leading: 4, bottom: 4, trailing: 4))
            

            
        }
        .navigationBarItems(trailing: EditButton())
        
    }
    
    func removeList1(at offset: IndexSet){
        self.section1Task.remove(atOffsets: offset)
    }
    
    func moveList1(from source: IndexSet, to destination: Int) {
        self.section1Task.move(fromOffsets: source, toOffset: destination)
    }
    func removeList2(at offset: IndexSet){
        self.section2Task.remove(atOffsets: offset)
    }
    
    func moveList2(from source: IndexSet, to destination: Int) {
        self.section2Task.move(fromOffsets: source, toOffset: destination)
    }
    
    
}
```
## 4.Form
* Form format 
```swift
Form{
  Section(header:Text(""),footer:Text(""){
    .....
  }
  Section(header:Text(""),footer:Text(""){
    ......
  }
  ....
}
```

## 5. @Environment Variables
* Used Environment variable to create a button that leaves the navigation view. 
* @Environment is specifically used to work with SwiftUI's own pre defined keys
* read a device setting or environment to adjust our view or behavior. 
` @Environment(\.presentationMode) var presentationMode`

```swift
            Section(){
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Text("DONE")
                })
                
            }
```

## 6. LazyVGrids
* must have array of `items` and `columns`
* example 
```swift
struct ContentView: View{
  let data = Array(1...1000).map{$0}
  let columns = [
         GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible()),
         
    var body: some View{ 
        ScollView(.vertical) {
            LazyVGrid(columns:columns, spacing: 20){
                  ForEach(data, id:\.self){i in 
                      Text(i)
                  }
             }
        }
    }
}



```

