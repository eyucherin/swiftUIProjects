//
//  NavigationPage.swift
//  Project1
//
//  Created by Elizabeth Yu on 2022/01/21.
//

//
//  NavigationPage.swift
//  Project1
//
//  Created by Elizabeth Yu on 2022/01/21.
//
import SwiftUI

struct NavigationPage: View {
    private let backgroundColor = [ Color.white, Color.red, Color.blue, Color.gray, Color.purple, Color.yellow]
    
    @State private var tapCount = 0
    
    @Binding var isActivated :Bool
    
     
    var body: some View {
        VStack{
            Text("HELLO USER")
                .font(.system(size: 30))
                .fontWeight(.bold)
            Text("Number of times tapped : \(self.tapCount)")
                .fontWeight(.semibold)
            Text("Is Activated: \(String(self.isActivated))")
                .fontWeight(.semibold)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .onTapGesture {
            print("\(self.tapCount)")
            self.tapCount += 1
        }
        .background(backgroundColor[tapCount % backgroundColor.count])
            
    }
}
