//
//  NetworkManager.swift
//  Foodie-Apps
//
//  Created by Denis Fajar Sidik on 06/11/23.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private let listFoodApi = "\(baseURL)/appetizers"
    
    private init() {
        
    }
    
    func getFoods(completed: @escaping (Result<Foods, NetworkError>) -> Void ) {
        guard let url = URL(string: listFoodApi) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unbaledComplete))
                return
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
                let foodsData = try decoder.decode(FoodReponse.self, from: data)
                completed(.success(foodsData.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
     
    func downloadImage(fromURLString imageURL: String, completed: @escaping (UIImage?) -> Void ) {
        let cacheKey = NSString(string: imageURL)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: imageURL) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        
        task.resume()
    }
    
}
