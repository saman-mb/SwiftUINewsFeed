//
//  Entities.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import Foundation

struct NewsArticleSource: Codable, Hashable, Equatable
{
    let id: String?
    let name: String
}

struct NewsArticle: Codable, Hashable, Equatable
{
    let source : NewsArticleSource
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

struct NewsFeedResponse: Codable, Hashable, Equatable
{
    let status: String
    let totalResults: UInt
    let articles: [NewsArticle]
}
