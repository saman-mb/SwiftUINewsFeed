//
//  NewsArticleView.swift
//  SwiftUIINewsFeed
//
//  Created by Saman Badakhshan on 10/11/2019.
//  Copyright © 2019 Nonisoft. All rights reserved.
//

import SwiftUI

struct NewsArticleView: View {
    @ObservedObject private var viewModel = NewsFeedViewModel()
    var body: some View {
        VStack {
            Text("Hello")
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView()
    }
}
