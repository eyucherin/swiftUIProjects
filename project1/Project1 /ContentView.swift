//
//  ContentView.swift
//  Project1
//
//  Created by Elizabeth Yu on 2022/01/21.
//

import SwiftUI

struct orangeVStack:View{
    @Binding var isActivated :Bool
    
    
    var body : some View{
        VStack{
            Text(self.isActivated ? "1!":"4!")
                .font(.system(size: 60))
                .fontWeight(.bold)
            
            Text(self.isActivated ? "2!":"5!")
                .font(.system(size: 60))
                .fontWeight(.bold)
            Text(self.isActivated ? "3!":"6!")
                .font(.system(size: 60))
                .fontWeight(.bold)
            
        }
        .background(self.isActivated ? Color.orange: Color.yellow)
        .padding(self.isActivated ? 10 : 0 )
    }
    
}


struct ContentView: View {
    
    @State private var isActivated : Bool = false
    
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
                    print("Taped Item is \(self.isActivated)")
                    withAnimation{
                        self.isActivated.toggle()
                    }
                }
                
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



