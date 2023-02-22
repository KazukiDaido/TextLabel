//
//  SaleToggle.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/22.
//

import SwiftUI

struct SaleToggle: View {
    @State private var flag = false
    
    
    var body: some View {
        Toggle(isOn: $flag) {
            Text(flag ? "セール中" : "")
        }
        .padding()
    }
}

struct SaleToggle_Previews: PreviewProvider {
    static var previews: some View {
        SaleToggle()
    }
}
