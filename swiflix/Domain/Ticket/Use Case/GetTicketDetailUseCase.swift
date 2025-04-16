//
//  GetTickerDetailuseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 02/02/25.
//

class GetTicketDetailUseCase {
    let ticketRepository: TicketRepository
    
    init(ticketRepository: TicketRepository) {
        self.ticketRepository = ticketRepository
    }
    
    func callAsFunction(_ id: String) async throws -> TicketEntity {
        return try await ticketRepository.getTicketDetail(id)
    }
}
