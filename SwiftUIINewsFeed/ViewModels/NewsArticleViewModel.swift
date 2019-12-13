//
//  NewsArticleViewModel.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import Foundation

class NewsArticleViewModel: ObservableObject
{
    @Published private(set) var title: String
    @Published private(set) var subtitle: String
    @Published private(set) var imageUrl: URL?
    
    init(title: String, subtitle: String, imageUrl: URL?)
    {
        self.title = title
        self.subtitle = subtitle
        self.imageUrl = imageUrl
    }
}
