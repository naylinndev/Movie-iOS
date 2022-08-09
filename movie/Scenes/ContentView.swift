//
//  ContentView.swift
//  movie
//
//  Created by Nay Linn on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .popular

    enum Tab {
        case popular
        case bookmark
    }

    var body: some View {
        TabView(selection: $selection) {
            PopularMoviesView().configureView()
                .tabItem {
                    Label("Popular", systemImage: "chart.line.uptrend.xyaxis")
                }
                .tag(Tab.popular)

            PopularMoviesView().configureView()
                .tabItem {
                    Label("Bookmark", systemImage: "book.fill")
                }
                .tag(Tab.bookmark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
