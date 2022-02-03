//
//  BeerRow.swift
//  Project4
//
//  Created by Elizabeth Yu on 2022/02/03.
//

import SwiftUI

struct BeerRow: View {
    let beer: Beer
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: "\(self.beer.image_url)")!) { image in image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.imageSize, height: self.imageSize)
                    .clipped()
                   
            } placeholder: {
                ProgressView()
                    .frame(width: self.imageSize, height: self.imageSize)
            }
            VStack(alignment: .leading, spacing: 0){
               
                Text("\(self.beer.name.uppercased())")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    
                    
                Text("\(self.beer.explanation)")
                    
            }
        }
    }
}

struct BeerRow_Previews: PreviewProvider {
    static var previews: some View {
        BeerRow(beer: Beer(id: 1, name: "Beer 1", tagline: "YUMM", food_pairing: ["one","two","three","four"], explanation: "very delicious beer", image_url: "https://images.punkapi.com/v2/2.png"))
                .previewLayout(.fixed(width: 300, height: 200))
    }
}
