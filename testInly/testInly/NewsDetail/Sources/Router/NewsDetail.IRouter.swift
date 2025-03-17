//
//  NewsDetail.IRouter.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import Foundation

public protocol INewsDetailRouter {
    func newsDetailRouterNavigateToSource(url: URL)
    func newsDetailRouterShowError(error: Error?)
}
