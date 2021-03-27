//
//  PersistenceManager.swift
//  Members
//
//  Created by Ufuk Canlı on 27.03.2021.
//

import Foundation

final class PersistenceManager {
    
    private var dataFilePath: URL {
        let path = Bundle.main.path(forResource: "hipo", ofType: "json")!
        return URL(fileURLWithPath: path)
    }
    
    func loadData() -> Company {
        if let data = try? Data(contentsOf: dataFilePath) {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let decodedData = try decoder.decode(Company.self, from: data)
                return decodedData
            } catch {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
        return sampleCompany
    }
}
