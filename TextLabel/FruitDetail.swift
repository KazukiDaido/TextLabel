//
//  FruitDetail.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/21.
//

import SwiftUI

struct FruitDetail: View {
    @EnvironmentObject var modelData: ModelData
    var fruits: Fruit
    /*var fruitIndex: Int{
        modelData.fruits.firstIndex(where: { $0.id == fruits.id })!

    }
    */
    var body: some View {
        HStack{
            Text(fruits.name)
            Text("\(fruits.value)円")
            if fruits.sale {
                Text("セール中")
            }
        }
    }
    
    struct FruitDetail_Previews: PreviewProvider {
        static let modelData = ModelData()
        static var previews: some View {
            FruitDetail(fruits: modelData.fruits[0])
                .environmentObject(modelData)
        }
    }
}
