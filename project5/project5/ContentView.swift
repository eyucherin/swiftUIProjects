//
//  ContentView.swift
//  project5
//
//  Created by Elizabeth Yu on 2022/02/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomTabView(tabIndex: .record)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
