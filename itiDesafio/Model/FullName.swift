//
//  FullName.swift
//  itiDesafio
//
//  Created by Filipe on 22/07/19.
//  Copyright © 2019 Filipe. All rights reserved.
//

import Foundation
struct FullName: Decodable {
    let first: String
    let last: String
    
    enum CodingKeys: String, CodingKey {
        case first, last
    }
    
    init(first: String, last: String) {
        self.first = first
        self.last = last
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let fisrt = try container.decode(String.self, forKey: .first)
        let last = try container.decode(String.self, forKey: .last)
        self.init(first: fisrt, last: last)
    }
}
