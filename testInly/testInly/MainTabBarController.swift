//
//  MainTabBarController.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let newsListVC = NewsListBuilder().build(mode: .News)
        let favoritesVC = NewsListBuilder().build(mode: .Favorite)

        newsListVC.tabBarItem = UITabBarItem(title: NewsListMode.News.rawValue, image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        favoritesVC.tabBarItem = UITabBarItem(title: NewsListMode.Favorite.rawValue, image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))

        let newsNavigationController = UINavigationController(rootViewController: newsListVC)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesVC)

        viewControllers = [newsNavigationController, favoritesNavigationController]
    }
}
