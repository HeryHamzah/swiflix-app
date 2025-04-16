//
//  ProfileRepository.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 06/12/23.
//

import Foundation

protocol ProfileRepository {
    func getProfile(uid: String) async throws -> UserEntity?
    func editProfile(user: UserEntity, photo: Data?) async throws -> UserEntity?
}
