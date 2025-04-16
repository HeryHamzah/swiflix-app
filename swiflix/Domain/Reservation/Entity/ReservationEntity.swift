//
//  ReservationEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 19/01/25.
//

import Foundation

struct ReservationEntity: Hashable {
    let id: String
    let theater: TheaterEntity
    let date: Date
    let time: TimeEntity
    let seats: [String]
}
