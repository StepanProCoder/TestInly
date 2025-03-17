//
//  NewsList.IRouter.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public protocol INewsListRouter {
    func newsListRouterNavigateToDetail(with news: News)
    func newsListRouterShowError(error: Error?)
}
