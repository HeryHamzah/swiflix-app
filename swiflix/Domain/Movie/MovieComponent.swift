//
//  MovieComponent.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/24.
//

import Foundation

class MovieComponent{
    var getForYouListUseCase: GetForYouListUseCase
    var getNowPlayingUseCase: GetNowPlayingUseCase
    var getUpcomingListUseCase: GetUpcomingListUseCase
    var getCreditsUseCase: GetCreditsUseCase
    var getMovieDetailUseCase: GetMovieDetailUseCase
    
    init(movieRepository: MovieRepository) {
        getForYouListUseCase = GetForYouListUseCase(repository: movieRepository)
        getNowPlayingUseCase = GetNowPlayingUseCase(repository: movieRepository)
        getUpcomingListUseCase = GetUpcomingListUseCase(repository: movieRepository)
        getCreditsUseCase = GetCreditsUseCase(movieRepository: movieRepository)
        getMovieDetailUseCase = GetMovieDetailUseCase(movieRepository: movieRepository)
    }
    
}
