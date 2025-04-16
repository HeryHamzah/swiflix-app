//
//  MovieDetailEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 11/09/24.
//

import Foundation

class MovieDetailEntity: MovieEntity {
    
    let genres: [GenreEntity]
    let releaseDate: Date?
    let duration: Int
    
    init(id: Int, title: String, voteAverage: Double, overview: String, popularity: Double, backdropPath: String?, posterPath: String?, genres: [GenreEntity], releaseDate: Date?, duration: Int, voteCount: Int) {
        self.genres = genres
        self.releaseDate = releaseDate
        self.duration = duration
        super.init(id: id, title: title, voteAverage: voteAverage, overview: overview, popularity: popularity, backdropPath: backdropPath, posterPath: posterPath, voteCount: voteCount)
    }
    
}

var mockMovieDetail: MovieDetailEntity = MovieDetailEntity(id: 1, title: "Inception", voteAverage: 8.8, overview: "A thief who enters the dreams of others to steal their secrets.",  popularity: 100.0, backdropPath: "https://images.unsplash.com/photo-1613679074971-91fc27180061?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", posterPath: "https://images.unsplash.com/photo-1635805737707-575885ab0820?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",  genres: [GenreEntity(id: 1, name: "Action")], releaseDate: Date.now, duration: 100, voteCount: 10)
