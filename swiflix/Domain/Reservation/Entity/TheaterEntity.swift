//
//  TheaterEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 17/01/25.
//

import Foundation

struct TheaterEntity: Identifiable, Equatable, Hashable {
    let id: UUID
    let name: String
    var schedules: [TimeEntity] = []
    let ticketPrice: Int
    
    init(name: String, schedules: [TimeEntity] = [], ticketPrice: Int) {
        self.id = UUID()
        self.name = name
        self.schedules = schedules
        self.ticketPrice = ticketPrice
    }
}
