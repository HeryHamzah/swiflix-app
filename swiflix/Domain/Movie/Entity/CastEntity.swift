//
//  CastEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 26/12/24.
//

import Foundation

struct CastEntity: Identifiable, Equatable {
    let id: Int
    let name: String
    let character: String
    let profilePath: String?
}

let mockCasts: [CastEntity] = [
    CastEntity(id: 1, name: "Robert Downey Jr.", character: "Iron Man", profilePath: "https://image.tmdb.org/t/p/w500/1YjdSym1jTG7xjHSI0yGGWEsw5i.jpg"),
    CastEntity(id: 2, name: "Chris Evans", character: "Captain America", profilePath: "https://image.tmdb.org/t/p/w500/3bOGNsHlrswhyW79uvIHH1V43JI.jpg"),
    CastEntity(id: 3, name: "Scarlett Johansson", character: "Black Widow", profilePath: "https://image.tmdb.org/t/p/w500/6NsMbJXRlDZuDzatN2akFdGuTvx.jpg"),
    CastEntity(id: 4, name: "Chris Hemsworth", character: "Thor", profilePath: "https://image.tmdb.org/t/p/w500/jpurJ9jAcLCYjgHHfYF32m3zJYm.jpg"),
    CastEntity(id: 5, name: "Mark Ruffalo", character: "Hulk", profilePath: "https://image.tmdb.org/t/p/w500/z3dvKqMNDQWk3QLxzumloQVR0pv.jpg"),
    CastEntity(id: 6, name: "Jeremy Renner", character: "Hawkeye", profilePath: "https://image.tmdb.org/t/p/w500/a1MlbLBk5Sy6YvMbSuKfwGlDVlb.jpg")
]

