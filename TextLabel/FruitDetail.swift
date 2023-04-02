//
//  FruitDetail.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/21.
//

import SwiftUI

struct FruitDetail: View {
    @EnvironmentObject var modelData: ModelData
    @State private var name = ""
    @State private var value = ""
    @State private var flag = true
    
    var fruits: Fruit
    
    var fruitIndex: Int{
        modelData.fruits.firstIndex(where: { $0.name == fruits.name })!
    }
    
    
    
    var body: some View {
        
        
        VStack{
            TextField("name", text: $name).onAppear(){
                self.name = modelData.fruits[fruitIndex].name
            }
            TextField("value", text: $value).onAppear(){
                self.value = "\(modelData.fruits[fruitIndex].value)"
            }
            SaleToggle(fruits: modelData.fruits[fruitIndex]).onAppear(){
                self.flag = modelData.fruits[fruitIndex].sale
            }
            Button("完了"){
                register()
                modelData.load()
            }
        }
        
    }
    
    func register() {
        let url = URL(string: "https://us-central1-fruitsapi.cloudfunctions.net/fruits/\(modelData.fruits[fruitIndex].key)")!  //URLを生成
        var request = URLRequest(url: url)//Requestを生成
        request.httpMethod = "PUT"
        let data: [String: Any] = ["name": name, "sale": flag, "value": Int(value)]
        let httpBody = try? JSONSerialization.data(withJSONObject: data, options: [])
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type") //bodyはJson形式であることを明示する
        request.httpBody = httpBody
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            do {
                /* let decoder = JSONDecoder()
                 let response = try decoder.decode(FruitData.self, from: data)
                 
                 DispatchQueue.main.async {
                 self.fruits = response.data.reversed()
                 }
                 */
                print("--------------------posted")
            } catch {
                fatalError("Couldn't parse as \(Fruit.self):\n\(error)")
            }
        }
        task.resume()
    }
}

struct FruitDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        FruitDetail(fruits: modelData.fruits[0])
            .environmentObject(modelData)
    }
}
