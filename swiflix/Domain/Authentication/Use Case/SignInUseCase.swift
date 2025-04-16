//
//  SignInUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/23.
//

import Foundation

class SignInUseCase {
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }
    
    func callAsFunction(email: String, password: String) async throws -> Bool {
        return try await authenticationRepository.signIn(email: email, password: password);
    }
}
