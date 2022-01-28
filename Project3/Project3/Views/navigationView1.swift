//
//  navigationView1.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/28.
//

import SwiftUI

struct navigationView1: View {
    @State var section1Task = [
        myCard(icon: "rectangle.and.pencil.and.ellipsis", title: "Task 1", start: 11, end: 12, backgroundColor: Color.purple),
        myCard(icon: "rectangle.and.pencil.and.ellipsis", title: "Task 2", start: 11, end: 12, backgroundColor: Color.pink),
        myCard(icon: "rectangle.and.pencil.and.ellipsis", title: "Task 3", start: 11, end: 12, backgroundColor: Color.green),
        myCard(icon: "rectangle.and.pencil.and.ellipsis", title: "Task 4", start: 11, end: 12, backgroundColor: Color.red),
        myCard(icon: "rectangle.and.pencil.and.ellipsis", title: "Task 5", start: 11, end: 12, backgroundColor: Color.blue)]
    
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

struct navigationView1_Previews: PreviewProvider {
    static var previews: some View {
        navigationView1()
    }
}
