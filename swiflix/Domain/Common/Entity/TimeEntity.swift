//
//  TimeEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 16/01/25.
//

import Foundation

struct TimeEntity: Identifiable, Equatable, Hashable {
    var id = UUID()
    
    let hour: Int
    let minute: Int
    
    var asString: String {
           String(format: "%02d:%02d", hour, minute)
       }
}
