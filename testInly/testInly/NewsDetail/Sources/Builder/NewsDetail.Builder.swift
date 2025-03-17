//
//  NewsDetail.Builder.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public struct NewsDetailBuilder {
    func build(news: News) -> NewsDetail.View {
        let newsDetailViewController = NewsDetail.View()
        let newsDetailPresenter = NewsDetail.Presenter(news: news)
        let newsDetailInteractor = NewsDetail.Interactor()
        let newsDetailRouter = NewsDetail.Router()
                
        newsDetailViewController.handler = newsDetailPresenter
        newsDetailPresenter.view = newsDetailViewController
        newsDetailPresenter.interactor = newsDetailInteractor
        newsDetailPresenter.router = newsDetailRouter
        newsDetailRouter.viewController = newsDetailViewController
        
        return newsDetailViewController
    }
}
