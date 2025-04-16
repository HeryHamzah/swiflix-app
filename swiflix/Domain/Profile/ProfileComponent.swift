//
//  ProfileComponent.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 06/12/23.
//

import Foundation

class ProfileComponent {
    var getProfileUseCase: GetProfileUseCase
    var editProfileUseCase: EditProfileUseCase
    
    init(profileRepository: ProfileRepository) {
        getProfileUseCase = GetProfileUseCase(profileRepository: profileRepository)
        editProfileUseCase = EditProfileUseCase(profileRepository: profileRepository)
    }
}
