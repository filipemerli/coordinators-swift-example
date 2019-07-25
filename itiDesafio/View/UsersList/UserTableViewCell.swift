//
//  UserTableViewCell.swift
//  itiDesafio
//
//  Created by Filipe on 25/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(user: User?) {
        titleLabel?.text = user?.name.first
        subTitleLabel?.text = user?.id
    }

}
