//
//  NewsList.Router+IRouter.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import UIKit
import Toast_Swift

extension NewsListRouter: NewsList.IRouter {
    public func newsListRouterShowError(error: Error?) {
        guard let error else { return }
        viewController?.view.makeToast(error.localizedDescription)
    }
    
    public func newsListRouterNavigateToDetail(with news: News) {
        let detailVC = NewsDetail.Builder().build(news: news)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
