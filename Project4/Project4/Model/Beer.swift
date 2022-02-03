//
//  Beer.swift
//  Project4
//
//  Created by Elizabeth Yu on 2022/02/03.
//

import Foundation

struct Beer: Codable,CustomStringConvertible,Identifiable,Hashable{
    var id: Int
    var name: String
    var tagline: String
    var food_pairing: [String]
    var explanation: String
    var image_url: String
    
    var description: String{
        return "\(name.uppercased()) : \(tagline)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case food_pairing
        case explanation = "description"
        case image_url
    }
}


