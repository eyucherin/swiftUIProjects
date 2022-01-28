//
//  myCard.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/28.
//

import SwiftUI

struct myCard: View {
    @State var icon: String
    @State var title: String
    @State var start: Int
    @State var end: Int
    @State var backgroundColor: Color
    
    var body: some View {
        HStack(spacing:20){
            Image(systemName: self.icon)
                .font(.system(size: 30))
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading, spacing: 0){
                //Divider().opacity(1)
                Rectangle().frame(height:0)
                Text(self.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer().frame(height:5)
                
                Text("\(self.start)~\(self.end)")
                    .foregroundColor(Color.white)
               
            }
            
        }
        .padding(20)
        .background(self.backgroundColor)
        .cornerRadius(20)
        
    }
}

struct myCard_Previews: PreviewProvider {
    static var previews: some View {
        myCard(icon: "person.fill.checkmark", title: "Meeting with John", start: 1, end: 2, backgroundColor: Color.blue)
    }
}
