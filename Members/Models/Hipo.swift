//
//  Hipo.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import Foundation

struct Hipo: Codable {
    let position: String
    let yearsInHipo: Int

    enum CodingKeys: String, CodingKey {
        case position
        case yearsInHipo = "years_in_hipo"
    }
}
