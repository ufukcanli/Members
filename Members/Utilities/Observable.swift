//
//  Observable.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import Foundation

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
