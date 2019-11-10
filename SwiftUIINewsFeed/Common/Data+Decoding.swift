//
//  Data+Decoding.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import Foundation

public extension Data
{
    func decoded<T: Decodable>() -> T?
    {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
