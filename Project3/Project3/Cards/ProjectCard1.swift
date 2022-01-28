//
//  ProjectCard1.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/27.
//

import SwiftUI

struct ProjectCard1: View {
    @State var showDetails = false
    var body: some View {
        VStack(alignment:.leading){
            Rectangle().frame(height:0)
            Text("Start On Project")
                .font(.title)
                .fontWeight(.bold)
            Text("10 AM - 11 AM ")
                .foregroundColor(.secondary)
            Rectangle().frame(height:0)
            HStack{
                Image("1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.green)
                    )
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke())
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke())
                Spacer()
                
                
                
                Button(action: {
                    print("Click Button")
                    self.showDetails.toggle()
                    //Toggle from false to true
                    print("show detail \(self.showDetails)")
                }, label: {
                    Text("Confirm")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(30)
                })
                    .alert(isPresented: $showDetails){
                        Alert(title: Text("TITLE"),
                              message: nil,
                              primaryButton: .destructive(Text("CANCEL")),
                              secondaryButton: .default(Text("OKAY"))
                        )
                        //Changes showDetail to false once completed
                    }
 
            }
        }
        
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
        
    }

}

struct ProjectCard1_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCard1()
    }
}
