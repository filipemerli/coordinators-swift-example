//
//  UserDetailViewController.swift
//  itiDesafio
//
//  Created by Filipe on 23/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    
    public var user: User? {
        didSet {
            DispatchQueue.main.async {
                self.idLabel?.text = self.user?.id
            }
        }
    }
    

}

