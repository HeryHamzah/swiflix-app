//
//  RemoteGenreModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 11/01/25.
//

import Foundation

struct RemoteGenreModel: Decodable {
    let id: Int
    let name: String
    
    func toEntity() -> GenreEntity {
        return GenreEntity(id: id, name: name)
    }
}
