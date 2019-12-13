    //
//  NewsFeedService.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import Foundation
import Combine

protocol NewsFeedService
{
    func fetchBreakingNews(forCountry country: Country) -> AnyPublisher<NewsFeedResponse, Error>
}

class NewsFeedServiceFactory
{
    static func makeService() -> NewsFeedService
    {
        return NewsApiOrgService()
    }
}
    
enum NewsFeedServiceError: Error
{
    case invalidUrl
}
    
enum Country: String
{
    case uk, us
}

private class NewsApiOrgService: NewsFeedService
{
    private let apiKey = "b572d827f9df493ebc57dfdff47f8ff7"
    
    func fetchBreakingNews(forCountry country: Country) -> AnyPublisher<NewsFeedResponse, Error>
    {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(country.rawValue)&apiKey=\(apiKey)") else
        {
            return Fail(error: NewsFeedServiceError.invalidUrl).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .map { $0.data }
            .decode(type: NewsFeedResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
