//
//  Member.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import Foundation

struct Member: Codable, Hashable {    
    let name: String
    let age: Int
    let location: String
    let github: String
    let hipo: Hipo
}

let sampleMember = Member(name: "John Doe",
                          age: 33,
                          location: "London",
                          github: "johndoe",
                          hipo: sampleHipo)
