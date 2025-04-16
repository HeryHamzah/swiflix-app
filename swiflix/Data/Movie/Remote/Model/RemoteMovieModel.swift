//
//  RemoteMovieModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/10/24.
//

import Foundation
import SwiftData

struct RemoteMovieModel : Decodable {
    let id: Int
    let title: String
    let vote_average: Double
    let overview: String
    let popularity: Double
    let backdrop_path: String?
    let poster_path: String?
    let vote_count: Int
    
    init(id: Int, title: String, vote_average: Double, overview: String, popularity: Double, backdrop_path: String?, poster_path: String?, vote_count: Int) {
        self.id = id
        self.title = title
        self.vote_average = vote_average
        self.overview = overview
        self.popularity = popularity
        self.backdrop_path = backdrop_path
        self.poster_path = poster_path
        self.vote_count = vote_count
    }
    
    func toEntity() -> MovieEntity {
        return MovieEntity(id: id,
                           title: title,
                           voteAverage: vote_average,
                           overview: overview,
                           popularity: popularity,
                           backdropPath: backdrop_path != nil ? MovieConstants.IMAGE_BASE_URL + backdrop_path! : nil,
                           posterPath: poster_path != nil ? MovieConstants.IMAGE_BASE_URL + poster_path! : nil,
                           voteCount: vote_count)
    }
}
