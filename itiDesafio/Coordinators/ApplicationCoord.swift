//
//  ApplicationCoord.swift
//  itiDesafio
//
//  Created by Filipe on 22/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import UIKit

class ApplicationCoord: Coordinator {
    let userStorage: UserStorage
    let window: UIWindow
    let rootViewController: UINavigationController
    let allUserListCoordinator: AllUsersCoordinator
    
    init(window: UIWindow) {
        self.window = window
        userStorage = UserStorage()
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = false
        
        allUserListCoordinator = AllUsersCoordinator(presenter: rootViewController, userStorage: userStorage)
    }
    
    func start() {
        window.rootViewController = rootViewController
        allUserListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
