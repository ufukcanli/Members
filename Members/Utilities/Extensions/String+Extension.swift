//
//  String+Extension.swift
//  Members
//
//  Created by Ufuk Canlı on 28.03.2021.
//

import Foundation

extension String {
    // the number of occurrences of a character in a string.
    func count(_ character: Character) -> Int {
        var count = 0
        for letter in self {
            if letter == character {
                count += 1
            }
        }
        return count
    }
}
