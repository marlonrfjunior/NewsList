//
//  NetworkingManager.swift
//  H4X0R News
//
//  Created by Marlon Junior on 05/05/22.
//

import Foundation

class NetworkingManager: ObservableObject{
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                           let results = try decoder.decode(Results.self, from: safeData)
                            self.posts = results.hits
                            print(results.hits)
                        }catch{
                            print(error)
                        }
                            
                    }
                }
            }
            task.resume()
        }
    }
}
