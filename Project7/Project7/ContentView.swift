//
//  ContentView.swift
//  Project7
//
//  Created by Elizabeth Yu on 2022/02/16.
//

import SwiftUI


let myFood =  ["Taco 🌮", "Pizza 🍕", "Dumpling 🥟"]

struct ContentView: View {
    
    @State private var shouldShowAlert : Bool = false
    @State private var myText : String = ""
    @State private var selected : Int = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                    Spacer()
                    Text("\(myFood[selected])")
                        .font(.system(size: 60))
                        .bold()
                    
                    Spacer()
                    Spacer()
                }
                .padding()
                .navigationTitle("Menu Demo")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Menu {
                            Button(action: {
                                shouldShowAlert = true
                                myText = "This is Alert 1"
                            }, label: {
                
                                Label("Alert 1" , systemImage: "bell")
                            })
                            // Multi Trailing Closure
                            Button {
                                shouldShowAlert = true
                                myText = "This is Alert 2"
                            } label : {
                                Label("Alert 2" , systemImage: "bell.fill")
                            }
                            
                            Section {
                                Button {
                                } label : {
                                    Label("Empty Task1" , systemImage: "rectangle.and.pencil.and.ellipsis")
                                }
                                Button {
                                } label : {
                                    Label("Empty Task2" , systemImage: "pencil.and.outline")
                                }
                            }
                            Section {
                 
                                Button {
                                } label : {
                                    Label("Other Empty Task" , systemImage: "trash")
                                }
                            }
                            
                            Picker(selection: $selected,
                                   label: Text("Pick Food")){
                                ForEach(myFood.indices,
                                        id: \.self,
                                        content: { index in
                                    Text("\(myFood[index])").tag(index)
                                })
                            }
                            
                        } label: {
                            Circle().foregroundColor(Color.green)
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Label("More", systemImage: "ellipsis")
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                )
                            
                        } // 메뉴
                    })
                }) // toolbar
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("ALERT"), message: Text("\(myText)"), dismissButton: .default(Text("okay")))
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
