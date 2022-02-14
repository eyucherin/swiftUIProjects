//
//  CustomTabView.swift
//  project5
//
//  Created by Elizabeth Yu on 2022/02/14.
//

import SwiftUI

enum TabIndex{
    case home,listen,record
}

struct CustomTabView: View {
   
    @State var tabIndex: TabIndex
    @State var largerScale: CGFloat = 1.3
    
    @ViewBuilder
    func showMyView(tabIndex: TabIndex) -> some View {
       switch tabIndex {
       case .home:
           myView(title: "Home", backgroundColor: Color.red)
       case .listen:
           myView(title: "Listen", backgroundColor: Color.blue)
       case .record:
           myView(title: "Record", backgroundColor: Color.green)

       }
    }
    
    func changeIconColor(tabIndex : TabIndex) -> Color{
        switch tabIndex {
        case .home:
           return  Color.red
        case .listen:
            return Color.blue
        case .record:
            return Color.green
        }
    }
    
    func calculateCirclePosition(tabIndex : TabIndex, geometry: GeometryProxy) -> CGFloat{
        switch tabIndex {
        case .home:
            return -(geometry.size.width / 3 )
        case .listen:
            return 0
        case .record:
            return  (geometry.size.width / 3 )
        }
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment:.bottom){
                
                self.showMyView(tabIndex: self.tabIndex)
                
                Circle()
                    .frame(width: 90, height: 90)
                    .offset(x: self.calculateCirclePosition(tabIndex: self.tabIndex, geometry: geometry), y: 10)
                    .foregroundColor(.white)
                HStack(spacing: 0){
                    
                    Button(action: {
                        print("HOME")
                        withAnimation{
                            self.tabIndex = .home
                        }
                      }) {
                          Image(systemName: "house")
                              .frame(width: geometry.size.width / 3 , height: 50)
                              .font(.system(size: 30))
                              .foregroundColor(self.tabIndex == .home ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
                              .scaleEffect(self.tabIndex == .home ? self.largerScale : 1.0)
                              .offset(y: self.tabIndex == .home ? -10 : 0 )
                        
                      }.background(Color.white)
                    
                    Button(action: {
                        print("LISTEN")
                        withAnimation{
                            self.tabIndex = .listen
                        }
                      }) {
                          Image(systemName: "airpodspro")
                              .frame(width: geometry.size.width / 3, height: 50)
                              .font(.system(size: 30))
                              .foregroundColor(self.tabIndex == .listen ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
                              .scaleEffect(self.tabIndex == .listen ? self.largerScale : 1.0)
                              .offset(y: self.tabIndex == .record ? -10 : 0 )
                      }.background(Color.white)
                    
                    Button(action: {
                        print("RECORD")
                        withAnimation{
                            self.tabIndex = .record
                        }
                      }) {
                          Image(systemName: "mic")
                              .frame(width: geometry.size.width / 3, height: 50)
                              .font(.system(size: 30))
                              .foregroundColor(self.tabIndex == .record ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
                              .scaleEffect(self.tabIndex == .record ? self.largerScale : 1.0)
                              .offset(y: self.tabIndex == .record ? -10 : 0 )
                      }.background(Color.white)
                }

            }
            
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabIndex: .home)
    }
}
 
