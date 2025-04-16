//
//  CheckSession.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation

class CheckSessionUseCase {
    private let sessionRepository: SessionRepository

        init(sessionRepository: SessionRepository) {
            self.sessionRepository = sessionRepository
        }

    func callAsFunction() -> String? {
        return sessionRepository.checkSession();
        }
}
