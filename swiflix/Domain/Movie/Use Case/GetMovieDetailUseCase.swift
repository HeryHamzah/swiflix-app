//
//  GetMovieDetailUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 11/01/25.
//

import Foundation

class GetMovieDetailUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func callAsFunction(id: Int) async  -> MovieDetailEntity? {
        return await movieRepository.getMovieDetail(id: id)
    }
    
}
