//
//  TextLabelApp.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/10.
//

import SwiftUI

@main

struct TextLabelApp: App {
    
   var fruits: [Fruit] = [
        Fruit(name: "banana", value: 100, sale: false),
        Fruit(name: "orange", value: 200, sale: false),
        Fruit(name: "grape", value: 300, sale: true)
    ]
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(textLabelApp: fruits)
        }
    }
}
