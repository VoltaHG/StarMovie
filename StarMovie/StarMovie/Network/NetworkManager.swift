//
//  NetworkManager.swift
//  StarMovie
//
//  Created by Dmytro on 27.09.2022.
//

import Foundation

class NetworkManager {
    
    // MARK:  private let moviesPath
    
    private let moviesPath = "https://j3gqy.mocklab.io/allMovies"
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func loadAllMoviesData(completionHandler: @escaping (Response) -> Void) {
        guard let url = URL(string: moviesPath) else { return }
        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: request) { data, response, error in
            let decoder = JSONDecoder()
            let result = try? decoder.decode([Movie].self, from: data!)
            
            if result == nil {
                completionHandler(.error("Something goes wrong"))
            } else {
                completionHandler(.succes(result ?? []))
            }
        }.resume()
    }
}
