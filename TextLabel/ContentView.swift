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
    
    @State private var showingModal = false
    
    
    var body: some View {
        VStack{
            NavigationView{
                List {
                    ForEach(0 ..< modelData.fruits.count, id: \.self) { index in
                        NavigationLink {
                            FruitDetail(fruits: modelData.fruits[index])
                        } label: {
                            Text(modelData.fruits[index].name)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Button {
                                        rowRemove(index: index)
                                    } label: {
                                        Text("削除")
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                    
                }
            }
            /*
             */
            Button(action: {
                self.showingModal.toggle()
            }) {
                HStack{
                    Image(systemName: "plus")
                        .padding(.leading)
                    Text("新規")
                    Spacer()
                }.sheet(isPresented: $showingModal) {
                    AddFruit()
                }
            }
        }
    }
    
    func rowRemove(index: Int) {
       
        print(modelData.fruits[index].key)
    }
}



struct ContentView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        ContentView()
            .environmentObject(modelData)
    }
}
