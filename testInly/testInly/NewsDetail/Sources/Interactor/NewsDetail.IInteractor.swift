//
//  NewsDetail.IInteractor.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

public protocol INewsDetailInteractor {
    func newsDetailInteractorCheckFavorite(news: News) -> Bool
    func newsDetailInteractorChangeFavoriteState(news: News) -> Error?
}
