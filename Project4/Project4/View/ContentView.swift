//
//  ContentView.swift
//  Project4
//
//  Created by Elizabeth Yu on 2022/02/03.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breweryFetcher = BreweryModel()
    @State private var searchText: String = ""
    var filteredBeer : [Beer]{
        if searchText.count == 0{
            return breweryFetcher.brewery
        }else{
            return breweryFetcher.brewery.filter{$0.name.contains(searchText)}
        }
    }
    var body: some View {
        NavigationView{
        VStack{
            List(breweryFetcher.brewery){ beer in
                ForEach(breweryFetcher.brewery){ beer in
                    NavigationLink{
                        BeerDetail(beer: beer )
                    } label:{
                        BeerRow(beer: beer)
                    }
                }
            }
            .navigationTitle("Beer Time!")
            .searchable(text: $searchText){
                ForEach(filteredBeer,id :\.self){ result in
                    Text("\(result.name)")
                        .searchCompletion(result.name)
                }
              }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
