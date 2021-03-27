//
//  ListViewModel.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import Foundation

final class ListViewModel {
    
    private var company = Observable<Company?>(nil)
    
    init() {
        company.value = Bundle.main.decode(Company.self,
                                           from: "hipo.json",
                                           keyDecodingStrategy: .convertFromSnakeCase)
    }
    
    var numberOfRowsInSection: Int {
        company.value?.members.count ?? 0
    }
    
    func member(at index: Int) -> Member {
        (company.value?.members[index])!
    }
}

final class Observable<T> {
    
    typealias Observer = (T) -> Void
    var observer: Observer?
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
}
