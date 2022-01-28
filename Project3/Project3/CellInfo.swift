//
//  CellInfo.swift
//  Project3
//
//  Created by Elizabeth Yu on 2022/01/28.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var subTitle: String 
    var done: Bool
    var color: Color
}
