//
//  UCError.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import Foundation

enum UCError: String, Error {
    case unableToAddNewMember = "There was an error adding this new member. Please try again."
    case alreadyInMembers = "You've already added this member. You must REALLY like him!"
}
