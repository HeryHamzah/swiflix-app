//
//  RemoteTicketModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 02/02/25.
//

import Foundation

struct RemoteTicketModel: Decodable {
    let order_id: String
    let movie_name: String
    let movie_poster_path: String?
    let ticket_date: Int
    let seats: [String]
    let ticket_time: String
    let total_price: Int
    let user_id: String
    let username: String
    let theater: String
    let transaction_date_time: Int
    
    
    func toEntity() throws -> TicketEntity {
        
        do {
            return TicketEntity(orderId: order_id, username: username, seats: seats, totalPrice: total_price, theaterName: theater, bookingDate: Date(timeIntervalSince1970: TimeInterval(ticket_date) / 1000.0), bookingTime: try convertStringToTimeEntity(ticket_time), movieName: movie_name, moviePosterPath: movie_poster_path, transactionDateTime: Date(timeIntervalSince1970: TimeInterval(transaction_date_time) / 1000.0))
        } catch {
            throw error
        }
        
    }
}
