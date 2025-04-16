//
//  TickeDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/01/25.
//

import Foundation

protocol TicketDataSource {
    func saveTicket(theaterName: String, ticketDate: Date, ticketTime: TimeEntity, transactionDateTime: Date, movieName: String, moviePosterPath: String?, orderId: String, seats: [String], totalPrice: Int, userId: String, username: String) async -> Bool
    
    func getNewestTickets() async throws -> [TicketEntity]
    
    func getExpiredTickets() async throws -> [TicketEntity]
    
    func getTicketDetail(_ id: String) async throws -> TicketEntity
}
