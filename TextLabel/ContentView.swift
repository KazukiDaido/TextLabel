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
        
        /*
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
         
         */
        VStack{
            NavigationView{
                List {
                    ForEach(0 ..< modelData.fruits.count, id: \.self) { index in
                        NavigationLink {
                            FruitDetail(fruits: modelData.fruits[index])
                        } label: {
                            Text(modelData.fruits[index].name)
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            print()
                        } label: {
                            Text("削除")
                        }
                        .tint(.red)
                    }
                    // .onDelete(perform: rowRemove)
                }
            }
            /*func rowRemove(offsets: IndexSet) {
             modelData.fruits.remove(atOffsets: offsets)
             }
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
                    ModalView()
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        ContentView()
            .environmentObject(modelData)
    }
}

struct ModalView: View {
    var body: some View {
        Text("Modal View.")
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
