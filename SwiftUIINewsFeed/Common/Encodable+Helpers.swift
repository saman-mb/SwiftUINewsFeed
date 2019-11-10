//
//  Codable+Helpers.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import Foundation

extension Encodable
{
    func asJsonData() -> Data?
    {
        return try? JSONEncoder().encode(self)
    }
}
