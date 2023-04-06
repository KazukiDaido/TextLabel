//
//  AddFruit.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/03/31.
//

import SwiftUI

struct AddFruit: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var name = ""
    @State private var value = ""
    @State private var flag = true
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .trailing){
            Button("完了"){
                register()
               // self.dismiss(animated: true, completion: nil)
            }   .padding()
        }
        VStack{
            
            TextField("name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("value", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Toggle("sale", isOn: $flag)
                .padding()
            
        }
    }
    
    func register() {
        let url = URL(string: "https://us-central1-fruitsapi.cloudfunctions.net/fruits")!  //URLを生成
        var request = URLRequest(url: url)//Requestを生成
        request.httpMethod = "POST"
        let data: [String: Any] = ["name": name, "sale": flag, "value": value]
        let httpBody = try? JSONSerialization.data(withJSONObject: data, options: [])
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type") //bodyはJson形式であることを明示する
        request.httpBody = httpBody
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let _ = data else { return }
            do {
                /* let decoder = JSONDecoder()
                 let response = try decoder.decode(FruitData.self, from: data)
                 
                 DispatchQueue.main.async {
                 self.fruits = response.data.reversed()
                 }
                 */
                print("--------------------posted")
                modelData.load()
                presentationMode.wrappedValue.dismiss()
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
