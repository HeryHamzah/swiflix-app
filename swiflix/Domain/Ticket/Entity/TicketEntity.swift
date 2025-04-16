//
//  TicketEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 02/02/25.
//

import Foundation

struct TicketEntity: Hashable {
    
    let orderId: String
    let username: String
    let seats: [String]
    let totalPrice: Int
    let theaterName: String
    let bookingDate: Date
    let bookingTime: TimeEntity
    let movieName: String
    let moviePosterPath: String?
    let transactionDateTime: Date
    
    init(orderId: String, username: String, seats: [String], totalPrice: Int, theaterName: String, bookingDate: Date, bookingTime: TimeEntity, movieName: String, moviePosterPath: String?, transactionDateTime: Date) {
        self.orderId = orderId
        self.username = username
        self.seats = seats
        self.totalPrice = totalPrice
        self.theaterName = theaterName
        self.bookingDate = bookingDate
        self.bookingTime = bookingTime
        self.movieName = movieName
        self.moviePosterPath = moviePosterPath
        self.transactionDateTime = transactionDateTime
    }
}

// Mock data for TicketEntity
let mockTicket = TicketEntity(
    orderId: "ORD123456",
    username: "johndoe",
    seats: ["A1", "A2", "A3"],
    totalPrice: 150000,
    theaterName: "Cinepolis Central Park",
    bookingDate: Date(), // Current date
    bookingTime: TimeEntity(hour: 19, minute: 30), // 19:30 (7:30 PM)
    movieName: "Inception",
    moviePosterPath: "https://images.unsplash.com/photo-1521714161819-15534968fc5f?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    transactionDateTime: Date()
)
