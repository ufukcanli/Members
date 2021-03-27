//
//  PersistenceManager.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import Foundation
    
enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let members = "members"
    }
    
    static func update(with member: Member, actionType: PersistenceActionType, completion: @escaping (UCError?) -> Void) {
        retrieveMembers { result in
            switch result {
            case .success(var members):
                switch actionType {
                case .add:
                    guard !members.contains(member) else {
                        completion(.alreadyInMembers)
                        return
                    }
                    members.append(member)
                case .remove:
                    members.removeAll { $0.name == member.name }
                }
                completion(save(members: members))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    static func retrieveMembers(completion: @escaping (Result<[Member], UCError>) -> Void) {
        guard let retrievedMembers = defaults.object(forKey: Keys.members) as? Data else {
            completion(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let members = try decoder.decode([Member].self, from: retrievedMembers)
            completion(.success(members))
        } catch {
            completion(.failure(.unableToAddNewMember))
        }
    }
    
    static func save(members: [Member]) -> UCError? {
        do {
            let encoder = JSONEncoder()
            let encodedMembers = try encoder.encode(members)
            defaults.set(encodedMembers, forKey: Keys.members)
            return nil
        } catch {
            return .unableToAddNewMember
        }
    }
}
