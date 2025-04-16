//
//  AuthenticationRepositoryImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation

class AuthenticationRepositoryImpl: AuthenticationRepository {
    
    private let authenticationDataSource: AuthenticationDataSource
    
    init(authenticationDataSource: AuthenticationDataSource){
        self.authenticationDataSource = authenticationDataSource
    }
    
    func signUp(email: String, password: String, name: String, selectedGenres: [GenreEnum],selectedYear: String?, profilePic: Data?) async throws -> Bool {
        return try await authenticationDataSource.signUp(email: email, password: password, name: name, selectedGenres: selectedGenres, selectedYear: selectedYear, profilePic: profilePic)
    }
    
    func signIn(email: String, password: String) async throws -> Bool {
        return try await authenticationDataSource.signIn(email: email, password: password)
    }
    
    func forgotPasword(email: String) async throws -> Bool {
       return try await authenticationDataSource.forgotPasword(email: email)
    }
    
    func uploadImage(image: Data) async throws -> String? {
        return try await authenticationDataSource.uploadImage(image: image)
    }
    
}
