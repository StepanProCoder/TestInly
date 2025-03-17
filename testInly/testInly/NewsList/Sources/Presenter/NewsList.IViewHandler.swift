//
//  NewsList.IViewHandler.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public protocol INewsListViewHandler {
    var newsListViewHandlerMode: NewsListMode { get }
    var newsListViewHandlerNewsList: [News] { get }
    
    func newsListViewHandlerOnViewWillAppear()
    func newsListViewHandlerOnDidSelectNews(index: Int)
    func newsListViewHandlerOnReachListEnd()
}
