//
//  NewsDetailViewController.swift
//  testInly
//
//  Created by Степан Тлеубаев  on 17.03.2025.
//

import UIKit

public class NewsDetailViewController: UIViewController {
    var handler: NewsDetail.IViewHandler?

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let newsImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let sourceButton = UIButton()
    private var favoriteButton: UIBarButtonItem!

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateDetailView()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "News"

        favoriteButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(toggleFavorite))
        navigationItem.rightBarButtonItem = favoriteButton

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceButton.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0

        authorLabel.font = .italicSystemFont(ofSize: 14)
        authorLabel.textColor = .gray

        newsImageView.contentMode = .scaleAspectFill
        newsImageView.clipsToBounds = true
        newsImageView.layer.cornerRadius = 10
        newsImageView.backgroundColor = .lightGray

        descriptionLabel.numberOfLines = 0

        sourceButton.setTitle("Read in source", for: .normal)
        sourceButton.setTitleColor(.systemBlue, for: .normal)
        sourceButton.addTarget(self, action: #selector(openSource), for: .touchUpInside)

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(newsImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(sourceButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            newsImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            newsImageView.heightAnchor.constraint(equalToConstant: 200),

            descriptionLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            sourceButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            sourceButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            sourceButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    public func updateDetailView() {
        titleLabel.text = handler?.newsDetailViewHandlerCurrentNews.title
        descriptionLabel.text = handler?.newsDetailViewHandlerCurrentNews.newsDescription
        authorLabel.text = "Author: \(handler?.newsDetailViewHandlerCurrentNews.author ?? "Unknown")"
        
        if let imageUrl = handler?.newsDetailViewHandlerCurrentNews.urlToImage, let url = URL(string: imageUrl) {
            newsImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "photo"))
        } else {
            newsImageView.image = UIImage(systemName: "photo")
        }
        
        updateFavoriteButton()
    }

    private func updateFavoriteButton() {
        let isFavorite = handler?.newsDetailViewHandlerIsFavorite == true
        let imageName = isFavorite ? "star.fill" : "star"
        favoriteButton.image = UIImage(systemName: imageName)
    }

    @objc private func toggleFavorite() {
        handler?.newsDetailViewHandlerOnToggleFavorite()
        updateFavoriteButton()
    }

    @objc private func openSource() {
        handler?.newsDetailViewHandlerOnOpenSource()
    }
}
