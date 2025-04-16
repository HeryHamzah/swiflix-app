//
//  UserEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/23.
//
import Foundation

struct UserEntity {
    let uid: String
    var name: String
    let email: String
    var profilePic: String?
    var selectedGenres: [GenreEnum]?
    var selectedYear: String?
    var balance: Int
    var favoriteMovies: [Int]?
    
    func copyWith(
        name: String? = nil,
        profilePic: String? = nil,
        selectedGenres: [GenreEnum]? = nil,
        selectedYear: String? = nil,
        balance: Int? = nil,
        favoriteMovies: [Int]? = nil
    ) -> UserEntity {
        return UserEntity(
            uid: self.uid,
            name: name ?? self.name,
            email: self.email,
            profilePic: profilePic ?? self.profilePic,
            selectedGenres: selectedGenres ?? self.selectedGenres,
            selectedYear: selectedYear ?? self.selectedYear,
            balance: balance ?? self.balance,
            favoriteMovies: favoriteMovies ?? self.favoriteMovies
        )
    }
    
}

let userMock = UserEntity(uid: "sdlojds", name: "Hery Hamzah", email: "hamzah@gmail.com", profilePic: "https://images.unsplash.com/photo-1613679074971-91fc27180061?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", balance: 0, favoriteMovies: nil)
