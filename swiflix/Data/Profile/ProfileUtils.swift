//
//  ProfileUtils.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/06/24.
//

import Foundation

func convertToGenreEnumList(from strings: [String]) -> [GenreEnum] {
    return strings.compactMap { GenreEnum(rawValue: $0) }
}

