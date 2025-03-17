//
//  NewsDetail.Router+IRouter.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import Foundation
import UIKit
import Toast_Swift

extension NewsDetail.Router: NewsDetail.IRouter {
    public func newsDetailRouterShowError(error: Error?) {
        guard let error else { return }
        viewController?.view.makeToast(error.localizedDescription)
    }
    
    public func newsDetailRouterNavigateToSource(url: URL) {
        UIApplication.shared.open(url)
    }
}
