//
//  NewsList.IView.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public protocol INewsListView: AnyObject {
    var newsListViewIsListEmpty: Bool { get }
    
    func newsListViewShowNews(_ news: [News])
}
