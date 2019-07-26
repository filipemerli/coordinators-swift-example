//
//  UserStorage.swift
//  itiDesafio
//
//  Created by Filipe on 23/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import Foundation

class UserStorage {
    
    static let sharedStorage = UserStorage()
    static let usersURL = Bundle.main.url(forResource: "randomContacts", withExtension: "json")!
    
    private let allUsersJson: [User]
    private let sortedUsers: [User]
    
    init() {
        let data = try! Data(contentsOf: UserStorage.usersURL)
        let allUsers = try! JSONDecoder().decode([User].self, from: data)
        
        allUsersJson = allUsers
        sortedUsers = allUsers.sorted(by: {$0.name.first < $1.name.first})
    }
    
    func allSortedUsers() -> [User] {
        return sortedUsers
    }
    
//    func getDictionary() -> [Character : [User]] {
//        let groupedUsers = Dictionary(grouping: sortedUsers, by: getFirstChar)
//        return groupedUsers
//    }
//    
//    private func getFirstChar(_ aDict: User) -> Character {
//        return aDict.name.first.uppercased().first ?? "0"
//    }
    
    
    
}
