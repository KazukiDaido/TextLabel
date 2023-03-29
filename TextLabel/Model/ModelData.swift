//
//  ModelData.swift
//  TextLabel
//
//  Created by 大道一輝 on 2023/02/18.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var fruits: [Fruit] = []
    
    init() {
        load()
    }
    
    
    func load() {
        let url = URL(string:"https://us-central1-fruitsapi.cloudfunctions.net/fruits")!  //URLを生成
        let request = URLRequest(url: url)//Requestを生成
        //request.httpMethod = "GET"
        //request.httpBody = "name=pineapple&sale=true&value=6000".data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(FruitData.self, from: data)
                
                DispatchQueue.main.async {
                    self.fruits = response.data.reversed()
                }
                print("--------------------posted")
            } catch {
                fatalError("Couldn't parse as \(Fruit.self):\n\(error)")
            }
        }
        task.resume()
    }
}
/*
 func load<T: Decodable>(_ filename: String) -> T {
 let data: Data
 
 guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
 else {
 fatalError("Couldn't find \(filename) in main bundle.")
 }
 
 do {
 data = try Data(contentsOf: file)
 } catch {
 fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
 }
 
 do {
 let decoder = JSONDecoder()
 return try decoder.decode(T.self, from: data)
 } catch {
 fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
 }
 }
 */
