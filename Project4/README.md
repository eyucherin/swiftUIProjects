# Project 4

![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)

* Learned to make an API call,fetch data from API, MVVM design pattern, create a search Text. 
* Punk API: https://punkapi.com/documentation/v2 

<p align="left">
<img src="https://user-images.githubusercontent.com/66363530/152369661-482975ef-b9f0-40da-a652-9b4c3e175099.gif" width="220" height="450" border="10"/>
</p>

# NOTES 

## 1. make an API Call 
* The following code fetches data from API and reads the, converts the data into a readable string and prints it out. 
* URLSession: provide an API for downloading data from and uploading data to endpoints indicated by URL
* URLSession.shared: For basic requests, the URLSession class provides a shared singleton session object that gives you a reasonable default behavior for creating tasks. Use the shared session to fetch the contents of a URL to memory with just a few lines of code.

```Swift
let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!

let task = URLSession.shared.dataTask(with: url){
    data, response, error in
    
    if let data = data, let string = String(data: data, encoding: .utf8){
        print(string)
    }
}

task.resume()
```

## 2. Fetch Data from API 
* Codable is actually a type alias that combines two protocols — Encodable and Decodable — into one. 
*  compiler will attempt to automatically synthesize the code required to encode or decode an instance of that type, which will work as long as we’re only using stored properties that themselves are encodable/decodable

```Swift
import Foundation


struct Post:Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!

let task = URLSession.shared.dataTask(with: url){
    data, response, error in
    
    let decoder = JSONDecoder()
    
    if let data = data, let post = try? decoder.decode(Post.self, from: data){
        print(post.title)
    }
}

task.resume()

```


## 3. MVVM Design Pattern 
* Model, View, View Model Architechture. 
* Model: Actual data we are dealing with. It holds the information but not the behaviors or services that manipulate the information. Business logic is typically kept separate from the model, 
* View:A View is what is presented on the screen. A view can also have behaviors associated with it, such as accepting user input. The view manages input (key presses, mouse movements, touch gestures, etc) which ultimately manipulates properties of the model.
* View Model:The buissness logic. One thing to remember about the view is that it is not responsible for maintaining its state. Instead, it will synchronize this with the viewmodel


##4. Creating a Search Text 







