//
//  UsersListViewController.swift
//  itiDesafio
//
//  Created by Filipe on 23/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import UIKit

protocol UsersListViewControllerDelegate: class {
    func usersListViewControllerDidSelectUser(_ selectedUser: User)
}

class UsersListViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!{
        didSet {
            let userCellNib = UINib(nibName: "UsersListVCTableViewCell", bundle: nil)
            usersTableView.register(userCellNib, forCellReuseIdentifier: "userCell")
        }
    }
    var userList: [User] = UserStorage.sharedStorage.allUser() {
        didSet {
            usersTableView?.reloadData()
        }
    }
    weak var delegate: UsersListViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView?.dataSource = self
        usersTableView?.delegate = self
    }

}

extension UsersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = userList[indexPath.row]
        delegate?.usersListViewControllerDidSelectUser(user)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        let user = userList[indexPath.row]
        cell.textLabel?.text = user.name.first
        cell.detailTextLabel?.text = user.name.last
        return cell
    }
    
    
}
