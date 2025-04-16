//
//  SessionComponent.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 03/12/23.
//

import Foundation

class SessionComponent {
    var saveSessionUseCase: SaveSessionUseCase
    var checkSessionUseCase: CheckSessionUseCase
    var removeSessionUseCase: RemoveSessionUseCase
    
    
    init(sessionRepository: SessionRepository) {
        saveSessionUseCase = SaveSessionUseCase(sessionRepository: sessionRepository)
        checkSessionUseCase = CheckSessionUseCase(sessionRepository: sessionRepository)
        removeSessionUseCase = RemoveSessionUseCase(sessionRepository: sessionRepository)
    }
}
