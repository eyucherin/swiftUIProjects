# Project 1 

* Learned how to use Navigation View, Animation, onTapGesture, and Data Flow using @State and @Binding Variables.

<p align="left">
<img src="https://user-images.githubusercontent.com/66363530/150526152-39075955-e16e-478f-855f-91ecb6a9db64.gif" width="220" height="450" border="10"/>
</p>

# NOTES 
## 1. Navigation View 

When you want to link a different view to current view, use navigation View. Navigation view is used to pop and push views around so it is best to use with lists or creating a sepate buttons to pop and push views. ALWAYS CALL NavigationView and link it with Navigation Link. To add a title page use navigationTitle. 

```Swift
struct ContentView: View {
        NavigationView {
                NavigationLink(destination: NavigationPage(isActivated: $isActivated)) {
                    Text("Navigation")
                        .font(.system(size: 20))
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(Color.white)
                        .cornerRadius(40)
                       
                }
                .padding()
                
                .navigationTitle("Navigation Page")

                
             }
          }
       }
         
    }
```

## 2. Animation and onTapGesture 

onTapGeture allows you to add actions when user taps on a particular section of the app. Animations help smooth out the user interface and it is commonly used with onTapGestures. There are many ways to implement animations but for this project I used the withAnimation method

```Swift
    .onTapGesture {
                        withAnimation{
                            self.isActivated.toggle()
                        }
                        print("Tapped Item is \(self.isActivated)")
                    }
```


## 3. Data Flow 

When giving and receiving data from different views always use the @State and @Binding variables. @State variables is where the data is being manipulated, meaning that it has control over the data. #Binding variables are used in places where we need to use that data but in different views. Pass @Binding variables to @State variables using $. 

```Swift

import SwiftUI

struct orangeVStack:View{
    @Binding var isActivated :Bool
    
    
    var body : some View{
        VStack{
            Text(self.isActivated ? "1!":"4!")
                .font(.system(size: 60))
                .fontWeight(.bold)
            
        }
        .background(self.isActivated ? Color.orange: Color.yellow)
        .padding(self.isActivated ? 10 : 0 )
    }
    
}


struct ContentView: View {
    
    @State private var isActivated : Bool = true
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                HStack {
                    orangeVStack(isActivated: $isActivated)
                    orangeVStack(isActivated: $isActivated)
                    orangeVStack(isActivated: $isActivated)
                }
                .padding(self.isActivated ? 10: 35)
                .background(self.isActivated ? Color.black: Color.red)
                .onTapGesture {
                    withAnimation{
                        self.isActivated.toggle()
                    }
                    print("Tapped Item is \(self.isActivated)")
                }
         
    }
       
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

```




