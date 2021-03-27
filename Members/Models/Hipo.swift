//
//  Hipo.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import Foundation

struct Hipo: Codable, Hashable {
    let position: String
    let yearsInHipo: Int
}

let sampleHipo = Hipo(position: "iOS", yearsInHipo: 3)
