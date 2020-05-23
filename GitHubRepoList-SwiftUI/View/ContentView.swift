//
//  ContentView.swift
//  GitHubRepoList-SwiftUI
//
//  Created by Satoshi Watanabe on 2020/05/23.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import SwiftUI
import Combine


struct ContentView: View {
    @ObservedObject var observed = RepoListViewModel()
    
    var body: some View {
        List {
            ForEach(observed.repos, id: \.self) { section in
                Text(section)
            }
        }.onAppear(perform: {self.observed.fetchRepos()})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
