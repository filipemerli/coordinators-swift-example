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

    var userListViewModel = UsersListViewModel!
    
    var keysCharArray: [Character]!
    
//    var dictUsers: [Character : [User]] = UserStorage.sharedStorage.getDictionary() {
//        didSet {
////            initializeArrays()
//            DispatchQueue.main.async {
//                self.usersTableView?.reloadData()
//            }
//        }
//    }
    
    var allUsersList: [User] = UserStorage.sharedStorage.allSortedUsers() {
        didSet {
//            initializeArrays()
            DispatchQueue.main.async {
                self.usersTableView?.reloadData()
            }
        }
    }
    
    weak var delegate: UsersListViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView?.dataSource = self
        usersTableView?.delegate = self
    }
    
//    private func initializeArrays() {
//        keysCharArray = Array(dictUsers.keys)
//        print(keysCharArray)
//    }

}

extension UsersListViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let user = dictUsers[indexPath.row]
//        delegate?.usersListViewControllerDidSelectUser(user)
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
}

extension UsersListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allUsersList.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "\(keysCharArray[section])"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let seila = dictUsers[]
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        let user = allUsersList[indexPath.row]
        cell.textLabel?.text = user.name.first
        cell.detailTextLabel?.text = user.name.last
        return cell
    }
    
    
}
