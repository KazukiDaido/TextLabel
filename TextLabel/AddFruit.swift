//
//  AddFruit.swift
//  TextLabel
//
//  Created by shuhei-ok on 2023/04/01.
//

import SwiftUI

struct AddFruit: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var modelData: ModelData

    @State var name: String = ""
    @State var value: Int = 0
    @State var sale: Bool = true

    var body: some View {
        VStack {
            TextField("name",text: $name)
            TextField("value", value: $value, format: .number)
            Toggle("sale", isOn: $sale)
            Button("登録"){
                let url = URL(string: "https://us-central1-fruitsapi.cloudfunctions.net/fruits")!  //URLを生成
                var request = URLRequest(url: url)//Requestを生成
                request.httpMethod = "POST"
                let data: [String: Any] = ["name": name, "sale": sale, "value": value]
                let httpBody = try? JSONSerialization.data(withJSONObject: data, options: [])
                request.setValue("Application/json", forHTTPHeaderField: "Content-Type") //bodyはJson形式であることを明示する
                request.httpBody = httpBody
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
                    guard let data = data else { return }
                    do {
                        
                        print("--------------------posted")
                        presentationMode.wrappedValue.dismiss()
                        modelData.load()
                    } catch {
                        fatalError("Couldn't parse as \(Fruit.self):\n\(error)")
                    }
                }.resume()
                
            }

        }
    }
}

struct AddFruit_Previews: PreviewProvider {
    static var previews: some View {
        AddFruit()
    }
}
