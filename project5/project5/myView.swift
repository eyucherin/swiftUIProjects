//
//  myView.swift
//  project5
//
//  Created by Elizabeth Yu on 2022/02/14.
//

import SwiftUI

struct myView: View {
    @State var title:String
    @State var backgroundColor: Color
    var body: some View {
        ZStack{
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
            
        }
    }
}

struct myView_Previews: PreviewProvider {
    static var previews: some View {
        myView(title: "Home", backgroundColor: .blue)
    }
}
