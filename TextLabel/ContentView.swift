//
//  ContentView.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingModal = false
    @State private var key = ""

    var body: some View {
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
                    .onDelete(perform: rowRemove)
                }
            }
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
    
    
    func rowRemove(offsets: IndexSet) {
        var fruits: Fruit
        var fruitIndex: Int{
            modelData.fruits.firstIndex(where: { $0.name == fruits.name })!
        }
      
        let url = URL(string: "https://us-central1-fruitsapi.cloudfunctions.net/fruits/\(modelData.fruits[fruitIndex].key)")!  //URLを生成
        var request = URLRequest(url: url)//Requestを生成
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            do {
                print("--------------------posted")
            } catch {
                fatalError("Couldn't parse as \(Fruit.self):\n\(error)")
            }
        }
        task.resume()
    }
}



struct ContentView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        ContentView()
            .environmentObject(modelData)
    }
}
