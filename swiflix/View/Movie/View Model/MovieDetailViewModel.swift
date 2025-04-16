//
//  MovieDetailViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 11/09/24.
//

import Foundation

@MainActor
@Observable class MovieDetailViewModel {
    let movieComponent: MovieComponent
    
    init(movieComponent: MovieComponent) {
        self.movieComponent = movieComponent
    }
    
    var credits: [CastEntity] = []
    var detail: MovieDetailEntity?
    var isLoadingGetCredits: Bool = false
    var isLoadingGetDetail: Bool = false
    
    public var isLoading: Bool {
        get {
            return isLoadingGetCredits || isLoadingGetDetail
        }
        
    }
    
    func getMovieDetail(id: Int) async {
        isLoadingGetDetail = true
        
        let detail = await movieComponent.getMovieDetailUseCase(id: id)
        
        self.detail = detail
        isLoadingGetDetail = false
    }
    
    func getCredits(id: Int) async {
        isLoadingGetCredits = true
        
        let credits = await movieComponent.getCreditsUseCase(id: id)
        
        self.credits = credits
        isLoadingGetCredits = false
    }
}
