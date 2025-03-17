//
//  NewsDetail.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 16.03.2025.
//

public enum NewsDetail {
    public typealias View = NewsDetailViewController
    public typealias Interactor = NewsDetailInteractor
    public typealias Presenter = NewsDetailPresenter
    public typealias Router = NewsDetailRouter
    
    public typealias IView = INewsDetailView
    public typealias IInteractor = INewsDetailInteractor
    public typealias IViewHandler = INewsDetailViewHandler
    public typealias IRouter = INewsDetailRouter
    
    public typealias Builder = NewsDetailBuilder
}
