//
//  Fruit.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/15.
//

import Foundation

struct Fruit: Hashable, Codable {
    var name: String
    var value: Int
    var sale: Bool
    /*init(name: String, value: Int, sale: Bool) {
        self.name = name
        self.value = value
        self.sale = sale
    }*/
}
