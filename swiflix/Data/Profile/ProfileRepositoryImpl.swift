//
//  ProfileRepositoryImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 06/12/23.
//

import Foundation

class ProfileRepositoryImpl: ProfileRepository {
    var remoteProfileDataSource: ProfileDataSource
    
    init(remoteProfileDataSource: ProfileDataSource) {
        self.remoteProfileDataSource = remoteProfileDataSource
    }
    
    func getProfile(uid: String) async throws -> UserEntity? {
        return try await remoteProfileDataSource.getProfile(uid: uid)
    }
    
    func editProfile(user: UserEntity, photo: Data? = nil) async throws -> UserEntity? {
        return try await remoteProfileDataSource.editProfile(user: user, photo: photo)
    }
    
    
}
