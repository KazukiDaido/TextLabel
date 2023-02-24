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
    
    var fruitIndex: Int{
     modelData.fruits.firstIndex(where: { $0.name == fruits.name })!
     }
     
    var body: some View {
        HStack{
            Text(modelData.fruits[fruitIndex].name)
            Text("\(modelData.fruits[fruitIndex].value)円")
            SaleToggle(fruits: modelData.fruits[fruitIndex])
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
