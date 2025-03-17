//
//  NewsList.Presenter+IViewHandler.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

extension NewsList.Presenter: NewsList.IViewHandler {
    public func newsListViewHandlerOnReachListEnd() {
        guard newsListViewHandlerMode == .News, view?.newsListViewIsListEmpty == false, !isLoading else { return }
        isLoading = true
        onFetchingData()
    }
    
    public func newsListViewHandlerOnViewWillAppear() {
        guard !(newsListViewHandlerMode == .News && view?.newsListViewIsListEmpty == false) else { return } // Чтобы лишний раз не дергать сеть
        onFetchingData()
    }
    
    public func newsListViewHandlerOnDidSelectNews(index: Int) {
        router?.newsListRouterNavigateToDetail(with: newsListViewHandlerNewsList[index])
    }
}
