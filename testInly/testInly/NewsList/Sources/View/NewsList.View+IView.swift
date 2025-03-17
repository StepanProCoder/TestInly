//
//  NewsList.View+IView.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import UIKit

extension NewsList.View: NewsList.IView {
    public var newsListViewIsListEmpty: Bool {
        tableView.numberOfRows(inSection: 0) == 0
    }
    
    public func newsListViewShowNews(_ news: [News]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
