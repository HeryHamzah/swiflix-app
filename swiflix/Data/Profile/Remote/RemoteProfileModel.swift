//
//  RemoteProfileModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 06/12/23.
//

import Foundation

struct RemoteProfileModel: Codable {
    let uid: String
    let full_name: String
    let email: String
    let profile_picture: String?
    var selected_genres: [String]?
    var selected_year: String?
    var balance: Int
    var favorite_movies: [Int]?
    
    func toEntity() -> UserEntity {
        let genres = selected_genres?.compactMap { GenreEnum(rawValue: $0) } ?? nil
        
        return UserEntity(uid: uid, name: full_name, email: email, profilePic: profile_picture, selectedGenres: genres, selectedYear: selected_year, balance: balance, favoriteMovies: favorite_movies)
    }
    
}
