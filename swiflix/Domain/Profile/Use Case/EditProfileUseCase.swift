//
//  EditProfileUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 06/12/23.
//

import Foundation

class EditProfileUseCase {
    private let profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
    
    func callAsFunction(user: UserEntity, photo: Data? = nil) async throws -> UserEntity? {
        return try await profileRepository.editProfile(user: user, photo: photo)
    }
}
