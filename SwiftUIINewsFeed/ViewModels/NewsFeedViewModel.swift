//
//  NewsFeedViewModel.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import Foundation
import Combine

class NewsFeedViewModel: ObservableObject
{
    @Published private(set) var articles: [NewsArticleViewModel] = []
    private let newsFeedService = NewsFeedServiceFactory.makeService()
    
    func refresh() -> AnyCancellable
    {
        self.articles.removeAll()
        return newsFeedService.fetchBreakingNews(forCountry: .uk).sink(receiveCompletion: { completion in
           //TODO: need to figure out how to handle completion enum
        }) { newsFeed in
            newsFeed.articles.forEach { article in
                self.articles.append(NewsArticleViewModel(title: article.title,
                                                          subtitle: article.content,
                                                          imageUrl: URL(string: article.urlToImage ?? "")))
            }
        }
    }
}
