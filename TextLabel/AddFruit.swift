//
//  AddFruit.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/03/31.
//

import SwiftUI

struct AddFruit: View {
    @State private var name = ""
    @State private var value = ""
    @State private var flag = true
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack{
            TextField("name", text: $name)
            TextField("value", text: $value)
            Toggle("sale", isOn: $flag)
            Button("完了"){
                register()
                modelData.load()
            }
        }
    }
    
    func register() {
        let url = URL(string: "https://us-central1-fruitsapi.cloudfunctions.net/fruits")!  //URLを生成
        var request = URLRequest(url: url)//Requestを生成
        request.httpMethod = "POST"
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


struct AddFruit_Previews: PreviewProvider {
    static var previews: some View {
        AddFruit()
    }
}
