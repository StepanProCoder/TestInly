//
//  NewsDetail.Presenter+IViewHandler.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import Foundation

extension NewsDetail.Presenter: NewsDetail.IViewHandler {
    public var newsDetailViewHandlerIsFavorite: Bool {
        interactor?.newsDetailInteractorCheckFavorite(news: newsDetailViewHandlerCurrentNews) == true
    }
    
    public func newsDetailViewHandlerOnToggleFavorite() {
        let error = interactor?.newsDetailInteractorChangeFavoriteState(news: newsDetailViewHandlerCurrentNews)
        router?.newsDetailRouterShowError(error: error)
    }
    
    public func newsDetailViewHandlerOnOpenSource() {
        guard let url = URL(string: newsDetailViewHandlerCurrentNews.url) else { return }
        router?.newsDetailRouterNavigateToSource(url: url)
    }
}
