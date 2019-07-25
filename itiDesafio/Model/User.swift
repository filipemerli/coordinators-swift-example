//
//  User.swift
//  itiDesafio
//
//  Created by Filipe on 22/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import Foundation
struct User: Decodable {
    let name: FullName
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case id = "_id"
    }
    
    init(name: FullName, id: String) {
        self.name = name
        self.id = id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(FullName.self, forKey: .name)
        let id = try container.decode(String.self, forKey: .id)
        self.init(name: name, id: id)
    }
}
