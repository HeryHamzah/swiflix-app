//
//  UploadImageUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/11/23.
//

import Foundation

class UploadImageUseCase {
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }
    
    func callAsFunction(image: Data) async throws -> String? {
        return try await authenticationRepository.uploadImage(image: image);
    }
}
