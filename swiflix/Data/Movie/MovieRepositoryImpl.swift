//
//  MovieRepositoryImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/24.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    let movieDataSource: MovieDataSource
    
    init(movieDataSource: MovieDataSource) {
        self.movieDataSource = movieDataSource
    }
    
    func getForYouList() async -> [MovieEntity] {
        return await movieDataSource.getForYouList()
    }
    
    func getNowPlayingList() async -> [MovieEntity] {
        return await movieDataSource.getNowPlayingList()
    }
    
    func getUpcomingList() async -> [MovieEntity] {
        return await movieDataSource.getUpcomingList()
    }
    
    func getCredits(id: Int) async -> [CastEntity] {
        return await movieDataSource.getCredits(id: id)
    }
    
    func getMovieDetail(id: Int) async -> MovieDetailEntity? {
        return await movieDataSource.getMovieDetail(id: id);
    }
    
}
