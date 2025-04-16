//
//  GetCreditsUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 26/12/24.
//

import Foundation

class GetCreditsUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func callAsFunction(id: Int) async  -> [CastEntity] {
        return await movieRepository.getCredits(id: id)
    }
    
}
