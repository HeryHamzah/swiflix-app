//
//  GetProfileUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 06/12/23.
//

import Foundation

class GetProfileUseCase {
    private let profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
    
    func callAsFunction(uid: String) async throws -> UserEntity? {
        return try await profileRepository.getProfile(uid: uid)
    }
}
