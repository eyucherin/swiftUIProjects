//
//  BeerDetail.swift
//  Project4
//
//  Created by Elizabeth Yu on 2022/02/03.
//

import SwiftUI

struct BeerDetail: View {
    let beer: Beer
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Text("\(self.beer.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .scaledToFit()
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .padding(.leading)
                    .padding(.trailing)
                   
                Text("\(self.beer.tagline)")
                    .font(.subheadline)
                    .fontWeight(.medium)

                Rectangle()
                    .cornerRadius(30)
                    .frame(width: 350, height: 350)
                    .foregroundColor(Color(hue: 0.108, saturation: 0.55, brightness: 0.859))
                    .overlay{
                        
                        AsyncImage(url: URL(string: "\(self.beer.image_url)")!) { image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height:300 )
                               
                        } placeholder: {
                            ProgressView()
                                .frame(width: 250, height: 250)
                        }
                    }
                    
                    .shadow(color: .black, radius: 3)
                    .padding()
                
                Group{
                    Divider()
                    Text("Beer Description")
                        .fontWeight(.bold)
                        .font(.system(size: 21))
                       
                    
                    Text("\(self.beer.explanation)")
                    
                    Divider()
                 
                    Text("Goes Well With ")
                        .fontWeight(.bold)
                        .font(.system(size: 21))
                    ForEach(self.beer.food_pairing,id:\.self){ i in
                        Text("      * \(i)")
                    }
                }
                .frame( maxWidth: 350, alignment: .leading)

            }
             
        }

    }
}

struct BeerDetail_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetail(beer: Beer(id: 1, name: "Beer 1", tagline: "YUMM", food_pairing: ["one","two","three","four"], explanation: "very  delicious beer ", image_url: "https://images.punkapi.com/v2/2.png"))
    }
}
