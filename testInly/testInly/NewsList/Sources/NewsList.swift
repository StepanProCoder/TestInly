//
//  NewsList.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 16.03.2025.
//

public enum NewsList {
    public typealias View = NewsListViewController
    public typealias Interactor = NewsListInteractor
    public typealias Presenter = NewsListPresenter
    public typealias Router = NewsListRouter
    
    public typealias IView = INewsListView
    public typealias IInteractor = INewsListInteractor
    public typealias IViewHandler = INewsListViewHandler
    public typealias IRouter = INewsListRouter
    
    public typealias Builder = NewsListBuilder
}
