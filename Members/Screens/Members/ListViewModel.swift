//
//  ListViewModel.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import Foundation

final class ListViewModel {
    
    private(set) var members = Observable<[Member]>([])
    private(set) var error = Observable<UCError?>(nil)
    
    init() {
        checkUser()
        fetchMembers()
    }
    
    var numberOfRowsInSection: Int {
        members.value.count
    }
    
    func member(at index: Int) -> Member {
        let member = members.value[index]
        return member
    }
    
    func removeMember(at index: Int) {
        let member = members.value[index]
        
        PersistenceManager.update(with: member, actionType: .remove) { [weak self] error in
            self?.error.value = error
        }
        
        fetchMembers()
    }
            
    func addNewMember() {
        let newMember = Member(name: "Ufuk Canlı",
                               age: 24,
                               location: "Düziçi, Osmaniye",
                               github: "@github",
                               hipo: Hipo(position: "intern",
                                          yearsInHipo: 0))
        
        PersistenceManager.update(with: newMember, actionType: .add) { [weak self] error in
            self?.error.value = error
        }
        
        fetchMembers()
    }
        
    private func fetchMembers() {
        PersistenceManager.retrieveMembers { [weak self] result in
            switch result {
            case .success(let members):
                self?.members.value = members

            case .failure(let error):
                self?.error.value = error
            }
        }
    }
    
    private func checkUser() {
        if !PersistenceManager.hasUser() {
            let company = Bundle.main.decode(Company.self,
                                             from: "hipo.json",
                                             keyDecodingStrategy: .convertFromSnakeCase)
            
            if let error = PersistenceManager.save(members: company.members) {
                self.error.value = error
            }
            
            PersistenceManager.setUser()
        }
    }
}
