//
//  TicketRepositoryImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 02/02/25.
//

import Foundation

class TicketRepositoryImpl: TicketRepository {
    let ticketDataSource: TicketDataSource
    
    init(ticketDataSource: TicketDataSource) {
        self.ticketDataSource = ticketDataSource
    }
    
    func getNewestTickets() async throws -> [TicketEntity] {
        return try await ticketDataSource.getNewestTickets()
    }
    
    func getExpiredTickets() async throws -> [TicketEntity] {
        return try await ticketDataSource.getExpiredTickets()
    }
    
    func getTicketDetail(_ id: String) async throws -> TicketEntity {
        return try await ticketDataSource.getTicketDetail(id)
    }
    
    func saveTicket(theaterName: String, ticketDate: Date, ticketTime: TimeEntity, transactionDateTime: Date, movieName: String, moviePosterPath: String?, orderId: String, seats: [String], totalPrice: Int, userId: String, username: String) async -> Bool {
        return await ticketDataSource.saveTicket(theaterName: theaterName, ticketDate: ticketDate, ticketTime: ticketTime, transactionDateTime: transactionDateTime, movieName: movieName, moviePosterPath: moviePosterPath, orderId: orderId, seats: seats, totalPrice: totalPrice, userId: userId, username: username)
    }
    
    
}
