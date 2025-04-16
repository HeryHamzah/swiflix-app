//
//  MovieViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/01/24.
//

import Foundation

@MainActor
@Observable
class MovieViewModel {
    let movieComponent: MovieComponent
    
    init(movieComponent: MovieComponent) {
        self.movieComponent = movieComponent
    }
    
    var forYouList: [MovieEntity] = []
    var favoriteCategories: [GenreEnum] = []
    var nowInCinemasList: [MovieEntity] = []
    var comingSoonList: [MovieEntity] = []
    var isLoadingGetForYouList: Bool = false
    var isLoadingGetFavoriteCategories: Bool = false
    var isLoadingGetNowInCinemasList: Bool = false
    var isLoadingGetComingSoonList: Bool = false
    
    let genres: [GenreEnum] = [.crime, .romance, .horror, .western]
    
    func getForYouList() async {
        
        isLoadingGetForYouList = true
        
        let forYouList = await movieComponent.getForYouListUseCase()
        
        self.forYouList = forYouList
        isLoadingGetForYouList = false
        
    }
    
    func getFavoriteCategories() async{
        isLoadingGetFavoriteCategories = true
        
        favoriteCategories = self.genres
        isLoadingGetFavoriteCategories = false
    }
    
    func getNowInCinemasList() async {
        isLoadingGetNowInCinemasList = true
        
        let nowInCinemas = await movieComponent.getNowPlayingUseCase()
        
        nowInCinemasList = nowInCinemas
        isLoadingGetNowInCinemasList = false
    }
    
    func getComingSoonList() async {
        isLoadingGetComingSoonList = true
        
        let upcomingList = await movieComponent.getUpcomingListUseCase()
        
        comingSoonList = upcomingList
        isLoadingGetComingSoonList = false
    }
}
