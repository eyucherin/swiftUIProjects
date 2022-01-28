//
//  navigationView2.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/28.
//

import SwiftUI

struct navigationView2: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var task = ""
    @State var indexValue: Int? = nil
    @State var indexValue2: Int? = nil
    @State var selectedValue : Color?  = nil
    @State var selectedIcon : String? = nil
    
    var colors = [ Color(red: 255 / 255, green: 99 / 255, blue: 71 / 255),
                 Color(red: 255 / 255, green: 160 / 255, blue: 114 / 255),
                 Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255),
                 Color(red: 50 / 255, green: 205 / 255, blue: 50 / 255),
                 Color(red: 0 / 255, green: 206 / 255, blue: 209 / 255),
                 Color(red: 30 / 255, green: 144 / 255, blue: 255 / 255),
                 Color(red: 123 / 255, green: 104 / 255, blue: 238 / 255),
                 Color(red: 218 / 255, green: 112 / 255, blue: 214 / 255),
                 Color(red: 119 / 255, green: 136 / 255, blue: 153 / 255),
                 Color(red: 255 / 255, green: 218 / 255, blue: 185 / 255),
                 Color(red: 290 / 255, green: 104 / 255, blue: 255 / 255),
                 Color(red: 210 / 255, green: 180 / 255, blue: 180 / 255),
               ]
    var symbols = ["plus.circle","plus.circle.fill","circle.circle","circle.circle","tray.circle","archivebox.circle","archivebox.circle","circle.hexagongrid.circle","paperclip.circle","bookmark.circle","graduationcap.circle","graduationcap.circle","power.circle","command.circle","wake.circle","snowflake.circle","snowflake.circle","circle.grid.3x3.circle","pause.circle","forward.circle","shuffle.circle","mic.circle","heart.circle","heart.circle",]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var body: some View {
            Form{
                Section(){
                    VStack(alignment:.center){
                        Image(systemName: selectedIcon ?? "plus.circle")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .foregroundColor(self.selectedValue ?? .black)
                        
                        .padding()
                        
                        VStack{
                            TextField("Task To Do",text:$task)
                                .frame(height:50)
                                .background(Color(hue: 1.0, saturation: 0.023, brightness: 0.812))
                                .cornerRadius(20)
                                .multilineTextAlignment(.center)
                                .font(Font.headline.bold())
                        
                        .padding()
                        }
   
                    }
                }
                Section(){
                    LazyVGrid(columns: columns){
                        ForEach(0...self.colors.count - 1,id: \.self){ val in
                            ZStack{
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(self.colors[val])
                                    .padding(5)
                                    .onTapGesture {
                                        self.indexValue = val
                                        self.selectedValue = colors[self.indexValue!]
                                    }
                                if (self.indexValue == val){
                                    
                                    Circle()
                                        .stroke(lineWidth: 3)
                                        .foregroundColor(Color.gray)
                                }
                                
                                }
                            }
                    }
                    
                }
                
                Section(){
                    LazyVGrid(columns: columns){
                        ForEach(0...self.symbols.count - 1 , id : \.self){ val in
                            ZStack{
                                Image(systemName: symbols[val])
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.black)
                                    .onTapGesture{
                                        self.indexValue2 = val
                                        self.selectedIcon = self.symbols[val]
                                   
                                    }
                                if (self.indexValue2 == val){
                                    
                                    Circle()
                                        .stroke(lineWidth: 3)
                                        .foregroundColor(Color.gray)
                                        .padding(-4)
                                }
                            }
                            
                        }
                    }
                }
                
            Section(){
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Text("DONE")
                })
                
            }
                
            

        }

    }
}

struct navigationView2_Previews: PreviewProvider {
    static var previews: some View {
        navigationView2()
    }
}
