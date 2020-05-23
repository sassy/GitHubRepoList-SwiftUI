//
//  RepoListViewModel.swift
//  GitHubRepoList-SwiftUI
//
//  Created by Satoshi Watanabe on 2020/05/23.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import Foundation
import Combine

class RepoListViewModel: ObservableObject {
    @Published var repos: Array<String>
    var cancellables: Set<AnyCancellable> = []
    let publisher = RepoListRepository().fetch()
    
    init() {
        repos = []
    }
    
    func fetchRepos() {
        print("fetchRepos")
        _ = publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("finish")
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { data in
            print(data)
            self.repos = data
        })
        .store(in: &cancellables)
    }
}
