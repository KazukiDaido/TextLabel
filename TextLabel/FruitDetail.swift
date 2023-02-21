//
//  FruitDetail.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/21.
//

import SwiftUI

struct FruitDetail: View {
    var fruits = TextLabelApp().fruits
    var fruitIndex: Int
    
    var body: some View {
        HStack{
            Text(fruits[fruitIndex].name)
            Text("\(fruits[fruitIndex].value)円")
            if fruits[fruitIndex].sale {
                Text("セール中")
            }
        }
    }
    
    struct FruitDetail_Previews: PreviewProvider {
        static var previews: some View {
            FruitDetail(fruitIndex: 0)
        }
    }
}
