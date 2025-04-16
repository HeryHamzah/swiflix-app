//
//  ReservationRepository.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/01/25.
//

protocol ReservationRepository {
    func reservation(reservation: ReservationEntity, totalPrice: Int, movieDetail: MovieDetailEntity) async -> Bool
}
