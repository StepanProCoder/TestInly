//
//  NewsDetail.IInteractor+Interactor.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

extension NewsDetail.Interactor: NewsDetail.IInteractor {
    public func newsDetailInteractorCheckFavorite(news: News) -> Bool {
        return CoreDataManager.shared.isFavorite(news: news)
    }
    
    public func newsDetailInteractorChangeFavoriteState(news: News) -> Error? {
        if newsDetailInteractorCheckFavorite(news: news) {
            return CoreDataManager.shared.deleteFavorite(news: news)
        } else {
            return CoreDataManager.shared.saveFavorite(news: news)
        }
    }
}
