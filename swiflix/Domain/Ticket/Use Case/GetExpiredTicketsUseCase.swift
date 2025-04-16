//
//  GetExpiredTicketsUceCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 02/02/25.
//

class GetExpiredTicketsUseCase {
    let ticketRepository: TicketRepository
    
    init(ticketRepository: TicketRepository) {
        self.ticketRepository = ticketRepository
    }
    
    func callAsFunction() async throws -> [TicketEntity] {
        return try await ticketRepository.getExpiredTickets()
    }
}
