//
//  listPractice.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/28.
//

import SwiftUI

struct listPractice: View {
    @State private var myList = ["a","b","c","d","e","f","g","h",]
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Section1"),footer: HStack{Text("There are 10 cells")}){
                    ForEach(1...10,id: \.self){
                        Text("\($0)")
                    }
                }
                .listRowInsets(EdgeInsets.init(top:20, leading: 20, bottom: 20, trailing: 0))
                
                Section(header: Text("Section2")){
                    ForEach(myList, id:\.self){
                        Text("\($0)")
                    }
                }
            }
            .listStyle(DefaultListStyle())
            .navigationBarHidden(true)
          
        }
      
    }
    
    func removeList(at offsets: IndexSet) {
           myList.remove(atOffsets: offsets)
    }
   func moveList(from source: IndexSet, to destination: Int) {
        myList.move(fromOffsets: source, toOffset: destination)
   }
    
}

struct listPractice_Previews: PreviewProvider {
    static var previews: some View {
        listPractice()
    }
}
