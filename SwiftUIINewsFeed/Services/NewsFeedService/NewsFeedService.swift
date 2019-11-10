    //
//  NewsFeedService.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import Foundation
import Combine

struct NewsArticleSource: Codable
{
    let id: String?
    let name: String
}

struct NewsArticle: Codable
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

struct NewsFeedResponse: Codable
{
    let status: String
    let totalResults: UInt
    let articles: [NewsArticle]
}

enum NewsFeedServiceError: Error
{
    case generic
}

protocol NewsFeedService
{
    func fetchBreakingNews() -> AnyPublisher<NewsFeedResponse, Error>
}

class NewsFeedServiceFactory
{
    static func makeService() -> NewsFeedService
    {
        return NewsApiOrgService()
    }
}

private class NewsApiOrgService: NewsFeedService
{
    private let apiKey = "b572d827f9df493ebc57dfdff47f8ff7"

    private struct RequestBody: Encodable
    {
        let country: String
        let apiKey: String
    }
    
    func fetchBreakingNewsTest()
    {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Hi")
        }
    }
    
    func fetchBreakingNews() -> AnyPublisher<NewsFeedResponse, Error>
    {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .map { $0.data }
            .decode(type: NewsFeedResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
