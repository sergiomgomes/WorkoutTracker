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
        
        var request = URLRequest(url: url)
        request.setValue("9682be830dmsh5416249a40a7ca3p112384jsn58ad42bc65ab", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("exercisedb.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
                let exercises = try decoder.decode([Exercise].self, from: data)
                completed(.success(exercises))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage) -> ()) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.cache.setObject(image, forKey: cacheKey)
                completed(image)
            }
        }
        
        task.resume()
    }
}
