//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Юлия Караневская on 28.05.21.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? ""
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://static.everypixel.com/ep-pixabay/0741/1093/6899/08857/7411093689908857422-news.jpg"
    }
}
