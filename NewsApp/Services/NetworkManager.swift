//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Юлия Караневская on 28.05.21.
//

import Foundation

class NetworkManager {
    
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = NetworkManager()
    private init() {}
    
    private let baseURL = "https://newsapi.org/v2/"
    private let headline = "top-headlines?country=us"
    
    func fetchNews(completion: @escaping ([News]?) -> Void) {
        let urlString = "\(baseURL)\(headline)&apiKey=\(APIKey.key)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsEnvelope = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.articles)
        }.resume()
    }
    
    func fetchImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImaged = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImaged as Data)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
