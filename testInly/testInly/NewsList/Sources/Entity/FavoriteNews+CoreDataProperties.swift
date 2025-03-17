//
//  FavoriteNews+CoreDataProperties.swift
//  
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//
//

import Foundation
import CoreData

extension FavoriteNews {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteNews> {
        return NSFetchRequest<FavoriteNews>(entityName: "FavoriteNews")
    }

    @NSManaged public var author: String?
    @NSManaged public var newsDescription: String?
    @NSManaged public var publishedAt: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var content: String?
}

extension FavoriteNews {
    static func from(news: News, context: NSManagedObjectContext) -> FavoriteNews {
        let favoriteNews = FavoriteNews(context: context)
        favoriteNews.title = news.title
        favoriteNews.newsDescription = news.newsDescription
        favoriteNews.url = news.url
        favoriteNews.author = news.author
        favoriteNews.publishedAt = news.publishedAt
        favoriteNews.urlToImage = news.urlToImage
        favoriteNews.content = news.content
        return favoriteNews
    }
}
