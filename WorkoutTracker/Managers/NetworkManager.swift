//
//  NetworkManager.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/26/23.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://exercisedb.p.rapidapi.com/"
    let cache = NSCache<NSString, UIImage>()
    
    private init(){}
    
    func getExercises(offset: Int, limit: Int, completed: @escaping(Result<[Exercise], WTError>) -> Void) {
        let endpoint = baseUrl + "/exercises?limit=\(limit)&offset=\(offset)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidParams))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let exercises = try decoder.decode([Exercise].self, from: data)
                completed(.success(exercises))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
