//
//  CellView.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/28.
//

import SwiftUI

struct CellView: View {
    @State var content: Task
    
    var body: some View {
        VStack(alignment: .leading){
            Rectangle().frame(height:0)
            
            HStack{
                Image(systemName: self.content.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading,spacing: 5){
                    Text(self.content.title)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                   
                    Text(self.content.subTitle)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button(action: {
                    self.self.content.done.toggle()
                    print("\(self.content.done)")
                }, label: {
                    ZStack{
                        Circle().frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        self.content.done ? Image(systemName: "checkmark") : Image("")
                        
                    }    

                })
 
            }
          
            
        }
        .padding()
        .background(self.content.color)
        .cornerRadius(30)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(content : Task(imageName: "checkmark.seal", title: "Hello", subTitle : "Goodnight",done: false, color: Color.red))
    }
}

