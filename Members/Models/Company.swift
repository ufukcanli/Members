//
//  Company.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import Foundation

struct Compnany: Codable {
    let company, team: String
    let members: [Member]
}
