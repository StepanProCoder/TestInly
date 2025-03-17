//
//  NewsDetailPresenter.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import Foundation

public class NewsDetailPresenter {
    weak var view: NewsDetail.IView?
    var interactor: NewsDetail.IInteractor?
    var router: NewsDetail.IRouter?
    
    public let newsDetailViewHandlerCurrentNews: News
    
    init(news: News) {
        self.newsDetailViewHandlerCurrentNews = news
    }
}
