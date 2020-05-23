//
//  RepoListRepository.swift
//  GitHubRepoList-SwiftUI
//
//  Created by Satoshi Watanabe on 2020/05/23.
//  Copyright © 2020 Satoshi Watanabe. All rights reserved.
//

import Foundation
import Combine
import Alamofire
import SwiftyJSON

struct RepoListRepository {
    func fetch() -> Future<Array<String>, Error> {
        return  Future<Array<String>, Error> { promise in
            AF.request("https://api.github.com/users/sassy/repos")
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let array: Array<String> = JSON(value).arrayValue.map { json in
                            json["full_name"].stringValue
                        }
                        promise(.success(array))
                    case .failure(let error):
                        print(error)
                        promise(.failure(error))
                    }
            }
        }
    }
}
