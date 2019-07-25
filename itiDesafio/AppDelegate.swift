//
//  AppDelegate.swift
//  itiDesafio
//
//  Created by Filipe on 22/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var applicationCoord: ApplicationCoord?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let applicationCoordinator = ApplicationCoord(window: window)
        self.window = window
        self.applicationCoord = applicationCoordinator
        applicationCoordinator.start()
        return true
    }


}

