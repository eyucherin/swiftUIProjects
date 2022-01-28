//
//  MyBasicCard.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/27.
//

import SwiftUI

struct MyBasicCard: View {
    var body: some View {
        HStack(spacing:20){
            Image(systemName: "flame")
                .font(.system(size: 50))
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading, spacing: 0){
                //Divider().opacity(1)
                Rectangle().frame(height:0)
                Text("hahahah")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer().frame(height:5)
                
                Text("hohoho")
                    .foregroundColor(Color.white)
               
            }
            
        }
        .padding(20)
        .background(Color.green)
        .cornerRadius(20)
        
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}
