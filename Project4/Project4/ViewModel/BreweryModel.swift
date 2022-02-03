//
//  BreweryModel.swift
//  Project4
//
//  Created by Elizabeth Yu on 2022/02/03.
//

import Foundation


class BreweryModel: ObservableObject{
    @Published var brewery = [Beer]()
    init(){
        fetchAllBeer()
    }
    
    func fetchAllBeer(){
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else{
            print("Invalid URL")
            return
        }
       
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            let decoder = JSONDecoder()

            if let data = data{
                do{
                    let brewery = try decoder.decode([Beer].self, from: data)
                    self.brewery = brewery
                }catch{
                    print(error)
                }
            }
        }
        
        task.resume()
    }
}


