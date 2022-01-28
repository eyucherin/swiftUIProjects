//
//  list2.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/28.
//

import SwiftUI

struct list2: View {
    @State private var numbers = [Int]()
    @State private var current = 0
    var body: some View {
        NavigationView{
            VStack{
                
                List{
                    Section(header:Text("Section1")){
                        ForEach(self.numbers,id:\.self){
                            Text("\($0)")
                        }
                        .onDelete(perform: removeNum)
                        .onMove(perform: moveNum)
                    }
                    Section(header:Text("Section2")){
                        ForEach(self.numbers,id:\.self){
                            Text("\($0)")
                        }
                    }
                    
                }
                .listStyle(InsetGroupedListStyle())
                
                Button(action: {
                    self.numbers.append(self.current)
                    self.current += 1
                }, label: {
                    Text("Add Number")
                })
            }
            .navigationTitle("My List")
            .navigationBarItems(leading: EditButton())
            
            
        }
    }
    
    func removeNum(at offset: IndexSet){
        self.numbers.remove(atOffsets: offset)
    }
    
    func moveNum(from source: IndexSet, to destination: Int) {
        self.numbers.move(fromOffsets: source, toOffset: destination)
           
    }
   

}

struct list2_Previews: PreviewProvider {
    static var previews: some View {
        list2()
    }
}
