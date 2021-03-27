//
//  ListViewModel.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import Foundation

final class ListViewModel {
    
    private let manager = PersistenceManager()
    private(set) var company = Observable<Company?>(nil)
    
    init() {
        company.value = manager.loadData()
    }
    
    var numberOfRowsInSection: Int {
        if let number = company.value?.members.count {
            return number
        } else {
            return 0
        }
    }
    
    func member(at index: Int) -> Member {
        if let member = company.value?.members[index] {
            return member
        } else {
            return sampleMember
        }
    }
}
