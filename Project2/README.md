# Project 2 

* Learned to use ZStack,VStack HStack, Image properties, Shapes and different ways to implement webView. 


<p align="left">
<img src="https://user-images.githubusercontent.com/66363530/150640238-60601939-da4a-4ed4-9f22-68872f1c3f55.gif" width="220" height="450" border="10"/>
</p>

# NOTES 

## 1. Image Properties 

*  .resizeable() to resize an image 
* .scaledToFit() or .scaledToFill() to determine how to fit your image accordingly. 
* .clippedShape() allows you to shape the image according the stated shape.
* .overlay() writes on top of your image 

```Swift
import SwiftUI

struct ImageView: View {
    var body: some View {               
            Image(systemName:"person")
                .resizable()
                .background(Color.yellow)
                .scaledToFill()
                .frame(width:250, height: 250)
                .clipShape(Circle())
                .shadow(color: .yellow, radius: 5, x: 0, y: 0)
                .overlay(
                    Circle()
                        .foregroundColor(.black)
                        .opacity(0.4)
                )
            
                .overlay(
                    Circle().stroke(Color.black,lineWidth: 6)
                      
                )
                .overlay(
                    Text("My profile")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                )
                .offset(y:-80)
        }
        
    }
}
```

## 2.Shape 

* use stroke property to draw a circle with only it boders, state the color and linewidth as parameter
`Circle().stroke(Color.black,lineWidth: 6)`


## 3.WebView 

* There are three way to call webView in swift 
### 1. Use Link Property 

This creates an animation and calls safari separately from your app

```Swift
struct webView: View {
    var body: some View {    
   Link (destination: URL(string: "https://www.linkedin.com/in/eyucherin/")!){
        Text("Linkedin")
            .font(.system(size: 20))
            .padding()
            .background(Color.yellow)
            .foregroundColor(.white)
            .cornerRadius(5)
      }
    }
  }
    
```

### 2. use onTapGesture 

This calls safari separately from you app but does not have any animations 
```Swift
struct webView: View {
    var body: some View {    
  Text("Github")
        .font(.system(size: 20))
        .padding()
        .background(Color.orange)
        .foregroundColor(.white)
        .cornerRadius(5)
        .onTapGesture {
            UIApplication.shared.open(URL(string: "https://github.com/eyucherin?tab=repositories")!, options: [:])
        }
      }
    }
```


### 3. Call Safari Services 

This calls safari from app and has no animations. 
You must implement a few methods before calling it 


```Swift

import SafariServices

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}

struct webView: View {
@State private var showSafari: Bool = false
var body: some View {
   Text("Medium")
          .font(.system(size: 20))
          .padding()
          .background(Color.green)
          .foregroundColor(.white)
          .cornerRadius(5)
          .onTapGesture{
              showSafari.toggle()
          }
          .fullScreenCover(isPresented: $showSafari, content: {
                  SFSafariViewWrapper(url: URL(string: "https://medium.com/me/stories/public")!)
          })
      }
  }
```








