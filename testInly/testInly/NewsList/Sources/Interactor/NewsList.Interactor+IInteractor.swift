//
//  NewsList.Interactor+IInteractor.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

extension NewsList.Interactor: NewsList.IInteractor {
    public func newsListInteractorFetchNews(mode: NewsListMode, page: Int, completion: @escaping ([News]?, Error?) -> ()) {
        switch mode {
        case .News:
            NetworkService.shared.fetchNews(page: page) { news, error in
                completion(news, error)
            }
        case .Favorite:
            let (favoriteNews, error) = CoreDataManager.shared.fetchFavorites()
            let news = favoriteNews?.map { News(favoriteNews: $0) }
            completion(news, error)
        }
    }
}
