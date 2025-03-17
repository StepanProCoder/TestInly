//
//  NetworkService.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 16.03.2025.
//

//
//  NetworkService.swift
//  testInly
//
//  Created by Степан Тлеубаев on 16.03.2025.
//

import Alamofire

public class NetworkService {
    public static let shared = NetworkService()
    private let apiKey = "408bcf06a86d4fe8b36b0b471696efae"
    private let url = "https://newsapi.org/v2/top-headlines?country=us"

    public func fetchNews(page: Int, completion: @escaping ([News]?, Error?) -> Void) {
        let requestUrl = "\(url)&apiKey=\(apiKey)&page=\(page)"
        
        AF.request(requestUrl).responseDecodable(of: NewsResponse.self) { response in
            switch response.result {
            case .success(let newsResponse):
                completion(newsResponse.articles, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
