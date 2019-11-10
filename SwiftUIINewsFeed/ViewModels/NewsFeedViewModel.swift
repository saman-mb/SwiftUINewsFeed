//
//  NewsFeedViewModel.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import Foundation
import Combine

struct NewsFeedItem
{
    let title: String
    let subTitle: String
    let imageUrl: URL?
}

class NewsFeedViewModel
{
    @Published var items: [NewsFeedItem] = []
    
    private let newsFeedService = NewsFeedServiceFactory.makeService()
    
    func refresh() -> AnyCancellable
    {
        return newsFeedService.fetchBreakingNews().sink(receiveCompletion: { completion in
            print(completion)
        }) { newsFeed in
            self.items = newsFeed.articles.map {
                NewsFeedItem(title: $0.title, subTitle: $0.content, imageUrl: URL(string: $0.urlToImage ?? ""))
            }
        }
    }
}
