//
//  Company.swift
//  Members
//
//  Created by Ufuk Canlı on 26.03.2021.
//

import Foundation

struct Company: Codable {
    let company: String
    let team: String
    let members: [Member]
}

let sampleCompany = Company(company: "Hipo",
                            team: "iOS",
                            members: [Member(name: "John Doe",
                                             age: 33,
                                             location: "London",
                                             github: "@johndoe",
                                             hipo: Hipo(position: "iOS",
                                                        yearsInHipo: 3))])
