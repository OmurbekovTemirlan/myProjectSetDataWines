//
//  HomeWineService.swift
//  myProject
//
//  Created by Apple on 7.4.2024.
//

import Foundation

class WineService {
   
    static let shared = WineService()
   
    func fetchData(completion: @escaping ([Wine]) -> Void) {
        if let url = URL(string: "https://api.sampleapis.com/wines/reds") {
            let urlSession = URLSession.shared
            let task = urlSession.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Ошибка при выполнении запроса:", error.localizedDescription)
                    return
                }
                
                guard let data = data else {
                    print("Данные не получены")
                    return
                }
                               
                do {
                    let wines = try JSONDecoder().decode([Wine].self, from: data)
                    DispatchQueue.main.async {
                        completion(wines)
                    }
                    print("Данные успешно получены и декодированы:", wines)
                } catch {
                    print("Ошибка декодирования данных:", error.localizedDescription)
                }
            }
            task.resume()
        }
    }
}
