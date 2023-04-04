//
//  SaleToggle.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/22.
//

import SwiftUI

struct SaleToggle: View {
    @Binding var flag: Bool
    //@EnvironmentObject var modelData: ModelData
    //var fruits: Fruit
    
//    var fruitIndex: Int{
//     modelData.fruits.firstIndex(where: { $0.key == fruits.key })!
//     }
   
    
    var body: some View {
        Toggle(isOn: $flag) {
            Text(flag ? "セール中" : "")
        }
        .padding()
    }
}

struct SaleToggle_Previews: PreviewProvider {
    static let modelData = ModelData()
    @State static var flag = true

    static var previews: some View {
        SaleToggle(flag: $flag)
            .environmentObject(modelData)
    }
}
