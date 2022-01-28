//
//  ContentView.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack (alignment: .bottomTrailing){
                ScrollView(.vertical){
                    VStack(spacing:10){
                        ProjectCard1()
                        myCard(icon: "rectangle.and.pencil.and.ellipsis", title: "Check up on Mom", start: 11, end: 12, backgroundColor: Color.purple)
                        myCard(icon: "pencil.tip.crop.circle", title: "Go To Class", start: 2, end: 3, backgroundColor: Color.blue)
                        myCard(icon: "lasso", title: "Reveiw Notes", start: 3, end: 4, backgroundColor: Color.red)
                        myCard(icon: "trash.slash.fill", title: "Go Home", start: 5, end: 6, backgroundColor: Color.orange)
                        myCard(icon: "folder.fill.badge.questionmark", title: "Take A nap", start: 7, end: 8, backgroundColor: Color.indigo)
                    }
                    .padding(20)
                }
                
                
                .navigationTitle("To Do List!")
                
                .navigationBarItems(
                    leading:NavigationLink(destination: navigationView1()){
                        Image(systemName: "list.dash")
                        .font(.system(size: 28))
                        .foregroundColor(.black)
                    }                               
                       
                )
                
                .navigationBarItems(
                    trailing:NavigationLink(destination: navigationView2()){
                        Image(systemName: "plus")
                        .font(.system(size: 28))
                        .foregroundColor(.black)
                    }
                    
                       
                )
                
                    
            }
            
            
        }
       
        
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
