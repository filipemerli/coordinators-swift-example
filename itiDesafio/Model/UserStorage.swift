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
    
    init() {
        let data = try! Data(contentsOf: UserStorage.usersURL)
        let allUsers = try! JSONDecoder().decode([User].self, from: data)
        
        allUsersJson = allUsers
    }
    
    func allUser() -> [User] {
        return allUsersJson
    }
    
}
