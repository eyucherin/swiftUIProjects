//
//  ContentView.swift
//  Project2
//
//  Created by Elizabeth Yu on 2022/01/22.
//

import SwiftUI
struct ContentView: View {

    var body: some View {
        
        ZStack{
            ImageView()
            webView()
                .offset(y:120)
              
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
