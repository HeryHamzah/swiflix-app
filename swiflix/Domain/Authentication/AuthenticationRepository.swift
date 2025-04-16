//
//  AuthenticationRepository.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/23.
//

import Foundation

protocol AuthenticationRepository{
    func signUp(email: String, password: String, name: String, selectedGenres: [GenreEnum],selectedYear: String?, profilePic: Data?) async throws -> Bool
    func signIn(email: String, password: String) async throws -> Bool
    func forgotPasword(email: String) async throws -> Bool
    func uploadImage(image: Data) async throws -> String?
}
