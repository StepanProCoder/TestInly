//
//  NewsDetail.IViewHandler.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public protocol INewsDetailViewHandler {
    var newsDetailViewHandlerIsFavorite: Bool { get }
    var newsDetailViewHandlerCurrentNews: News { get }
    
    func newsDetailViewHandlerOnToggleFavorite()
    func newsDetailViewHandlerOnOpenSource()
}
