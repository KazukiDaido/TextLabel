//
//  ContentView.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/10.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var textName = "Hello world!"
    //var fruits = TextLabelApp().fruits
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        
        VStack {
            Text(textName)
            Text(textName)
            Text(textName)
            HStack {
                Text(textName)
                Text(textName)
                Text(textName)
            }
            TextField("名前を入力", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
            Button("名前変更ボタン") {
                if name == "" {
                    textName = "Hello world!"
                } else {
                    textName = name
                }
            }
            
            NavigationView{
                List {
                    ForEach(0 ..< modelData.fruits.count, id: \.self) { index in
                        NavigationLink {
                            FruitDetail(fruits: modelData.fruits[index])
                        } label: {
                            Text(modelData.fruits[index].name)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
