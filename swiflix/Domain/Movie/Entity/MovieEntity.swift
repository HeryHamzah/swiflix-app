//
//  MovieEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/01/24.
//

class MovieEntity: Identifiable, Hashable {
    static func == (lhs: MovieEntity, rhs: MovieEntity) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
          hasher.combine(id)
      }
    
    let id: Int
    let title: String
    let voteAverage: Double
    let overview: String
    let popularity: Double
    let backdropPath: String?
    let posterPath: String?
    let voteCount: Int
    
    init(id: Int, title: String, voteAverage: Double, overview: String,  popularity: Double, backdropPath: String?, posterPath: String?, voteCount: Int) {
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.popularity = popularity
        self.backdropPath = backdropPath
        self.posterPath = posterPath
        self.voteCount = voteCount
    }
    
}

var mockMovies =
[
    MovieEntity(id: 2, title: "The Shawshank Redemption", voteAverage: 9.3, overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", popularity: 95.0, backdropPath: "https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", posterPath: "https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", voteCount: 10),
    MovieEntity(id: 1, title: "Inception", voteAverage: 8.8, overview: "A thief who enters the dreams of others to steal their secrets.",  popularity: 100.0, backdropPath: "https://images.unsplash.com/photo-1635805737707-575885ab0820?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", posterPath: "https://images.unsplash.com/photo-1635805737707-575885ab0820?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", voteCount: 10),
   
    MovieEntity(id: 3, title: "The Dark Knight", voteAverage: 9.0, overview: "When the menace known as The Joker emerges, Batman must confront him.",  popularity: 98.7490, backdropPath: "https://images.unsplash.com/photo-1613679074971-91fc27180061?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", posterPath: "https://images.unsplash.com/photo-1613679074971-91fc27180061?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", voteCount: 10),
    MovieEntity(id: 4, title: "Pulp Fiction", voteAverage: 8.9, overview: "Various interconnected people in Los Angeles undergo their personal tribulations.", popularity: 92.0, backdropPath: "pulp_fiction_backdrop.jpg", posterPath: "https://images.unsplash.com/photo-1635805737707-575885ab0820?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", voteCount: 10),
    
]

