//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Юлия Караневская on 28.05.21.
//

import Foundation

class NewsListVewModel {
    
    var newsViewModel = [NewsViewModel]()
    
    let reuseID = "news"
    
    func fetchNews(completion: @escaping ([NewsViewModel]) -> Void) {
        NetworkManager.shared.fetchNews { news in
            guard let news = news else {
                return
            }
            let newsViewModel = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsViewModel = newsViewModel
                completion(newsViewModel)
            }
            
        }
    
    }
}
