//
//  AllUsersCoordinator.swift
//  itiDesafio
//
//  Created by Filipe on 22/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import UIKit

class AllUsersCoordinator: Coordinator {
    private let presenter: UINavigationController
    private let allUsersList: [User]
    private var userListViewController: UsersListViewController?
    private var userDetailCoordinator: UserDetailCoordinator?
    private let userStorage: UserStorage
    //let viewController = UsersListViewController.instantiateViewController()
    
    init(presenter: UINavigationController, userStorage: UserStorage) {
        self.presenter = presenter
        self.userStorage = userStorage
        allUsersList = userStorage.allUser()
    }
    
    func start() {
        let userListViewController = UsersListViewController(nibName: nil, bundle: nil)
        userListViewController.delegate = self
        userListViewController.title = "User list"
        userListViewController.userList = allUsersList
        presenter.pushViewController(userListViewController, animated: true)
        self.userListViewController = userListViewController
    }
}

extension AllUsersCoordinator: UsersListViewControllerDelegate {
    func usersListViewControllerDidSelectUser(_ selectedUser: User) {
        let userDetailCoordinator = UserDetailCoordinator(presenter: presenter, user: selectedUser, userStorage: userStorage)
        userDetailCoordinator.start()
        
        self.userDetailCoordinator = userDetailCoordinator
    }
}
