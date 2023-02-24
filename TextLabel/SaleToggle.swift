//
//  SaleToggle.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/22.
//

import SwiftUI

struct SaleToggle: View {
    //@State var flag: Bool
    @EnvironmentObject var modelData: ModelData
    var fruits: Fruit
    
    var fruitIndex: Int{
     modelData.fruits.firstIndex(where: { $0.name == fruits.name })!
     }
   
    
    var body: some View {
        Toggle(isOn: $modelData.fruits[fruitIndex].sale) {
            Text(modelData.fruits[fruitIndex].sale ? "セール中" : "")
        }
        .padding()
    }
}

struct SaleToggle_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
  
        SaleToggle(fruits: modelData.fruits[0])
            .environmentObject(modelData)
    }
}
