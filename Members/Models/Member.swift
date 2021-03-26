//
//  Member.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import Foundation

struct Member: Codable {
    let name: String
    let age: Int
    let location, github: String
    let hipo: Hipo
}
