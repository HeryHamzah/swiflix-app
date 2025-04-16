//
//  SignUpUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/23.
//

import Foundation

class SignUpUseCase {
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }
    
    func callAsFunction(email: String, password: String, name: String, selectedGenres: [GenreEnum],selectedYear: String?, profilePic: Data?) async throws -> Bool {
        return try await authenticationRepository.signUp(email: email, password: password, name: name, selectedGenres: selectedGenres, selectedYear: selectedYear, profilePic: profilePic);
    }
}
