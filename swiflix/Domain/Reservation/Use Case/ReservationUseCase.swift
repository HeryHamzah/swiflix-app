//
//  ReservationUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/01/25.
//

class ReservationUseCase {
    private let repository: ReservationRepository
    
    init(repository: ReservationRepository) {
        self.repository = repository
    }
    
    func callAsFunction(reservation: ReservationEntity, totalPrice: Int, movieDetail: MovieDetailEntity) async -> Bool {
        return await repository.reservation(reservation: reservation, totalPrice: totalPrice, movieDetail: movieDetail)
    }
}
