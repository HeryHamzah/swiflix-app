//
//  GetNowPlayingUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/24.
//

import Foundation

class GetNowPlayingUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func callAsFunction() async  -> [MovieEntity] {
        return await repository.getNowPlayingList()
    }
}
