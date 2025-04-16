//
//  MovieDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/24.
//

import Foundation

protocol MovieDataSource {
    func getForYouList() async -> [MovieEntity]
    func getNowPlayingList() async  -> [MovieEntity]
    func getUpcomingList() async -> [MovieEntity]
    func getCredits(id: Int) async -> [CastEntity]
    func getMovieDetail(id: Int) async -> MovieDetailEntity?
}
