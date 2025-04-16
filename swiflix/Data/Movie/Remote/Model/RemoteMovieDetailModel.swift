//
//  RemoteMovieDetailModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 11/01/25.
//

import Foundation

struct RemoteMovieDetailModel: Decodable {
    let id: Int
    let title: String
    let vote_average: Double
    let overview: String
    let popularity: Double
    let backdrop_path: String?
    let poster_path: String?
    let vote_count: Int
    let genres: [RemoteGenreModel]
    let release_date: String
    let runtime: Int
    
    func toEntity() -> MovieDetailEntity {
        return MovieDetailEntity(id: id,
                                 title: title,
                                 voteAverage: vote_average,
                                 overview: overview,
                                 popularity: popularity,
                                 backdropPath: backdrop_path != nil ? MovieConstants.IMAGE_BASE_URL + backdrop_path! : nil,
                                 posterPath: poster_path != nil ? MovieConstants.IMAGE_BASE_URL + poster_path! : nil,
                                 genres: genres.map({ $0.toEntity()}),
                                 releaseDate:  release_date.toyyyyMMddDate(),
                                 duration: runtime, voteCount: vote_count)
    }
}
