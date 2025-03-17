//
//  Builder.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public struct NewsListBuilder {
    func build(mode: NewsListMode) -> NewsList.View {
        let newsListViewController = NewsList.View()
        let newsListPresenter = NewsList.Presenter(mode: mode)
        let newsListInteractor = NewsList.Interactor()
        let newsListRouter = NewsList.Router()
                
        newsListViewController.handler = newsListPresenter
        newsListPresenter.view = newsListViewController
        newsListPresenter.interactor = newsListInteractor
        newsListPresenter.router = newsListRouter
        newsListRouter.viewController = newsListViewController
        
        return newsListViewController
    }
}

public enum NewsListMode: String {
    case News
    case Favorite
}
