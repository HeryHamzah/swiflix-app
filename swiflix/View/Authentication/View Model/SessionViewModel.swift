//
//  SessionViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 15/10/23.
//

import Foundation

@Observable class SessionViewModel {
    var sessionComponent: SessionComponent
    
    init(sessionComponent: SessionComponent){
        self.sessionComponent = sessionComponent
    }
    
    var isLoggedIn: Bool = false
    var isLoggedOut: Bool = false
    var uid: String?
    
    
    func checkSession() {
        let session = sessionComponent.checkSessionUseCase()
        
        if session != nil {
            isLoggedIn = true
        }
        
            self.uid = session
      
        
    }
    
    func logout() {
        let isRemoved = sessionComponent.removeSessionUseCase()
        
        isLoggedIn = !isRemoved;
        isLoggedOut = isRemoved;
        
        DispatchQueue.main.async {
            self.uid = nil
        }
        
    }
    
}
