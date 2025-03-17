//
//  News.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public struct News: Decodable {
    let title: String
    let newsDescription: String?
    let url: String
    let author: String?
    let publishedAt: String
    let urlToImage: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case title
        case newsDescription = "description"
        case url
        case author
        case publishedAt
        case urlToImage
        case content
    }
    
    init(favoriteNews: FavoriteNews) {
        self.title = favoriteNews.title ?? ""
        self.newsDescription = favoriteNews.newsDescription
        self.url = favoriteNews.url ?? ""
        self.author = favoriteNews.author
        self.publishedAt = favoriteNews.publishedAt ?? ""
        self.urlToImage = favoriteNews.urlToImage
        self.content = favoriteNews.content
    }
}

struct NewsResponse: Decodable {
    let articles: [News]
}
