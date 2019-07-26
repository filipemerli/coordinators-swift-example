//
//  UsersListVCModelView.swift
//  itiDesafio
//
//  Created by Filipe on 26/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import Foundation

protocol UsersListViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchFailed(with reason: String)
}

final class UsersListViewModel {
    private weak var delegate: UsersListViewModelDelegate?
    private var users: [User] = []
    private var isFetching = false // for Protocol logic
    
    //let client = GitHubAPIClient()  // Client
    
    init(delegate: UsersListViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - ModelView main functions for ViewControllers usage
    
    func getUsers() -> [User] {
        return self.users
    }
    
    func getDictionary() -> [Character : [User]] {
        let groupedUsers = Dictionary(grouping: sortedUsers, by: getFirstChar)
        return groupedUsers
    }
    
    private func getFirstChar(_ aDict: User) -> Character {
        return aDict.name.first.uppercased().first ?? "0"
    }
    
    
    // MARK: - fecth Repos Function
    
//    func fetchRepos(name: String) {
//        guard !isFetching else {
//            return
//        }
//        isFetching = true
//        client.fetchRepos(name: name) { result in
//            switch result {
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.isFetching = false
//                    self.delegate?.onFetchFailed(with: error.reason)
//                }
//            case .success(let response):
//                DispatchQueue.main.async {
//                    self.repos.append(contentsOf: response)
//                    self.isFetching = false
//                    self.delegate?.onFetchCompleted()
//                }
//            }
//        }
//    }
    
}

