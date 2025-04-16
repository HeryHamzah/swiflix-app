//
//  ForgotPasswordUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/23.
//

import Foundation

class ForgotPasswordUseCase {
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }
    
    func callAsFunction(email: String) async throws -> Bool {
        return try await authenticationRepository.forgotPasword(email: email);
    }
}
