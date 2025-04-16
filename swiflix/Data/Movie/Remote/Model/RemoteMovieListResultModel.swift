//
//  MovieListResultModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 21/10/24.
//

import Foundation

struct RemoteMovieListResultModel: Decodable {
    let results: [RemoteMovieModel]
}
