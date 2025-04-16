//
//  RemoveSessionUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation

class RemoveSessionUseCase {
    private let sessionRepository: SessionRepository

        init(sessionRepository: SessionRepository) {
            self.sessionRepository = sessionRepository
        }

    func callAsFunction() -> Bool {
        return sessionRepository.removeSession();
        }
}
