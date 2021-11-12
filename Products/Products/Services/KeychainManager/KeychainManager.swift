//
//  KeychainManager.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import Foundation
import KeychainSwift



// MARK: - KeychainManager
class KeychainManager {
    
    // MARK: - Private properties
    
    // MARK: - Public properties
    
    // MARK: - Life cycle
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    func getData<T>(for key: KeyChainKeys) -> T? {
       return KeychainSwift().get(key.rawValue) as? T
    }
    
    func save<T: Equatable>(data: T, for key: KeyChainKeys) {
        switch data {
        case data where ((data as? String) != nil):
            KeychainSwift().set((data as? String) ?? "",
                                forKey: key.rawValue,
                                withAccess: .none)

        case data where ((data as? Bool) != nil):
            KeychainSwift().set((data as? Bool) ?? false,
                                forKey: key.rawValue,
                                withAccess: .none)

        case data where ((data as? Data) != nil):
            KeychainSwift().set((data as? Data) ?? Data(),
                                forKey: key.rawValue,
                                withAccess: .none)
        default:
            break
        }
    }
    
    func deleteData(for key: KeyChainKeys) {
        KeychainSwift().delete(key.rawValue)
    }
    
}
