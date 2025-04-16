//
//  SaveSessionUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation

class SaveSessionUseCase {
    private let sessionRepository: SessionRepository

        init(sessionRepository: SessionRepository) {
            self.sessionRepository = sessionRepository
        }

    func callAsFunction(userId: String) {
        return sessionRepository.saveSession(userId: userId);
        }
}
