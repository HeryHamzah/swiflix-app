//
//  AuthenticationDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation

protocol AuthenticationDataSource {
    func signUp(email: String, password: String, name: String, selectedGenres: [GenreEnum],selectedYear: String?, profilePic: Data?) async throws -> Bool
    func signIn(email: String, password: String) async throws -> Bool
    func forgotPasword(email: String) async throws -> Bool
    func createOrUpdateUser(user: UserEntity) async throws -> Bool
    func uploadImage(image: Data) async throws -> String?
}
