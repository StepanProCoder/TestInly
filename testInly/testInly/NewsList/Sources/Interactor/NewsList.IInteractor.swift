//
//  NewsList.IInteractor.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public protocol INewsListInteractor {
    func newsListInteractorFetchNews(mode: NewsListMode, page: Int, completion: @escaping ([News]?, Error?) -> ())
}
