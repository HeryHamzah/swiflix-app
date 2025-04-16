//
//  CastModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 26/12/24.
//

import Foundation

struct RemoteCastModel: Decodable {
    let id: Int
    let name: String
    let profile_path: String?
    let character: String
    
    func toEntity() -> CastEntity {
        return CastEntity(id: id,
                          name: name,
                          character: character,
                          profilePath: profile_path != nil ? MovieConstants.IMAGE_BASE_URL + profile_path! : nil
        )
    }
}
