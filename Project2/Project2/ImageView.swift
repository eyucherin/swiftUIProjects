//
//  ImageView.swift
//  Project2
//
//  Created by Elizabeth Yu on 2022/01/22.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        ZStack{
            Image("backgroundPic")
                .resizable()
                .scaledToFill()
                .frame(height:400)
                .offset(y:-255)
                
            Image(systemName:"person")
                .resizable()
                .background(Color.yellow)
                .scaledToFill()
                .frame(width:250, height: 250)
                .clipShape(Circle())
                .shadow(color: .yellow, radius: 5, x: 0, y: 0)
                .overlay(
                    Circle()
                        .foregroundColor(.black)
                        .opacity(0.4)
                )
            
                .overlay(
                    Circle().stroke(Color.black,lineWidth: 6)
                      
                )
                .overlay(
                    Text("My profile")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                )
                .offset(y:-80)
        }
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
