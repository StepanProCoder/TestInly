//
//  NewsListPresenter.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import Foundation

public class NewsListPresenter {
    weak var view: NewsList.IView?
    var interactor: NewsList.IInteractor?
    var router: NewsList.IRouter?
    
    var isLoading: Bool = false
    var currentPage: Int = 1
    
    public let newsListViewHandlerMode: NewsListMode
    public var newsListViewHandlerNewsList: [News] = []
    
    public init(mode: NewsListMode) {
        self.newsListViewHandlerMode = mode
    }
    
    func onFetchingData() {
        interactor?.newsListInteractorFetchNews(mode: newsListViewHandlerMode, page: currentPage) { [weak self] news, error in
            self?.isLoading = false
            self?.router?.newsListRouterShowError(error: error)
            guard let news else { return }
            switch self?.newsListViewHandlerMode {
            case .News:
                self?.newsListViewHandlerNewsList += news
                self?.currentPage += 1
            case .Favorite:
                self?.newsListViewHandlerNewsList = news
            case nil:
                break
            }
            self?.view?.newsListViewShowNews(news)
        }
    }
}
