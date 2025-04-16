//
//  SessionRepositoryImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation

class SessionRepositoryImpl: SessionRepository {
    
    private let localSessionDataSource: SessionDataSource
    
    init(localSessionDataSource: SessionDataSource) {
        self.localSessionDataSource = localSessionDataSource
    }
    
    func saveSession(userId: String) {
       return localSessionDataSource.saveSession(userId: userId)
    }
    
    func removeSession() -> Bool {
      return localSessionDataSource.removeSession()
    }
    
    func checkSession() -> String? {
        return localSessionDataSource.checkSession()
    }
    
    
}
