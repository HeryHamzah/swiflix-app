//
//  LocalSessionDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation

class LocalSessionDataSource: SessionDataSource {
    
    func saveSession(userId: String) {
        UserDefaults.standard.set(userId, forKey: SessionKeys.userId)
      
    }
    
    func removeSession() -> Bool {
        UserDefaults.standard.removeObject(forKey: SessionKeys.userId)
        return true
    }
    
    func checkSession() -> String? {
        let session = UserDefaults.standard.string(forKey: SessionKeys.userId)
        
        return session
    }
    
    
}
