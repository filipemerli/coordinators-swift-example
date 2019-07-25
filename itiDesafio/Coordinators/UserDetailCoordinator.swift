//
//  UserDetailCoordinator.swift
//  itiDesafio
//
//  Created by Filipe on 25/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import UIKit

class UserDetailCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var userDetailViewController: UserDetailViewController?
    private var userListViewController: UsersListViewController?
    private let user: User
    
    init(presenter: UINavigationController, user: User, userStorage: UserStorage) {
        self.user = user
        self.presenter = presenter
    }
    
    func start() {
        let userDetailViewController = UserDetailViewController()
        userDetailViewController.title = "\(user.name.first) \(user.name.last)"
        userDetailViewController.user = user
        
        presenter.pushViewController(userDetailViewController, animated: true)
        self.userDetailViewController = userDetailViewController
    }
}

