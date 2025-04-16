//
//  RemoteTicketDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/01/25.
//

import Foundation
import FirebaseFirestore

class RemoteTicketDataSource: TicketDataSource {
    let sessionDataSource: SessionDataSource
    
    init(sessionDataSource: SessionDataSource) {
        self.sessionDataSource = sessionDataSource
    }
    
    func saveTicket(theaterName: String, ticketDate: Date, ticketTime: TimeEntity, transactionDateTime: Date, movieName: String, moviePosterPath: String?, orderId: String, seats: [String], totalPrice: Int, userId: String, username: String) async -> Bool {
        let db = Firestore.firestore()
        
        let ticketData: [String: Any] = [
            "theater": theaterName,
            "ticket_time": ticketTime.asString,
            "ticket_date": ticketDate.millisecondsSinceEpoch,
            "movie_name": movieName,
            "movie_poster_path": moviePosterPath as Any,
            "order_id": orderId,
            "seats": seats,
            "total_price": totalPrice,
            "user_id": userId,
            "username": username,
            "transaction_date_time": transactionDateTime.millisecondsSinceEpoch,
        ]
        
        let docRef = db.collection("tickets").document()
        do {
            try await docRef.setData(ticketData)
            print("Document successfully written!")
            return true
        } catch {
            print("Error writing document: \(error)")
            return false
        }
    }
    
    func getNewestTickets() async throws -> [TicketEntity] {
        let db = Firestore.firestore()
        
        do {
            let sessionId = sessionDataSource.checkSession()
            
            guard let sessionId else {
                return [] //TODO: throw error
            }
            
            let querySnapshot = try await db.collection("tickets").whereField("user_id", isEqualTo: sessionId).getDocuments()
            
            // Konversi DocumentSnapshot ke RemoteTicketModel
            let remoteTickets = try querySnapshot.documents.compactMap { document in
                let data = document.data()
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                let remoteTicket = try JSONDecoder().decode(RemoteTicketModel.self, from: jsonData)
                return remoteTicket
            }
            
            // Filter tiket yang booking_time-nya sebelum hari ini
            let currentDate = Date() // Tanggal dan waktu saat ini
            let calendar = Calendar.current
            
            let filteredTickets = try remoteTickets.filter { remoteTicket in
                // Konversi booking_time ke Date
                let bookingTimeInterval = TimeInterval(remoteTicket.ticket_date) / 1000.0
                let bookingDate = Date(timeIntervalSince1970: bookingTimeInterval)
                
                // Ambil jam dan menit dari field "time"
                let timeComponents = remoteTicket.ticket_time.components(separatedBy: ":")
                guard timeComponents.count == 2,
                      let hour = Int(timeComponents[0]),
                      let minute = Int(timeComponents[1]) else {
                    throw NSError(domain: "InvalidTimeFormat", code: -1, userInfo: nil)
                }
                
                // Buat Date dari jam dan menit
                var bookingTimeComponents = calendar.dateComponents([.year, .month, .day], from: bookingDate)
                bookingTimeComponents.hour = hour
                bookingTimeComponents.minute = minute
                
                guard let bookingTime = calendar.date(from: bookingTimeComponents) else {
                    throw NSError(domain: "InvalidBookingTime", code: -1, userInfo: nil)
                }
                
                // Bandingkan dengan waktu saat ini
                return bookingTime >= currentDate
            }
            
            // Konversi RemoteTicketModel ke TicketEntity
            let ticketEntities = try filteredTickets.map { try $0.toEntity() }
                .sorted(by: { $0.bookingDate < $1.bookingDate })
            
            // Kembalikan array TicketEntity
            return ticketEntities
            
        } catch {
            throw error
        }
    }
    
    func getExpiredTickets() async throws -> [TicketEntity] {
        let db = Firestore.firestore()
            
            do {
                // Cek session dan dapatkan sessionId
                let sessionId = sessionDataSource.checkSession()
                
                // Jika sessionId nil, kembalikan array kosong
                guard let sessionId else {
                    return [] //TODO: throw error
                }
                
                // Ambil data dari Firestore
                let querySnapshot = try await db.collection("tickets")
                    .whereField("user_id", isEqualTo: sessionId)
                    .getDocuments()
                
                // Konversi DocumentSnapshot ke RemoteTicketModel
                let remoteTickets = try querySnapshot.documents.compactMap { document in
                    let data = document.data()
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let remoteTicket = try JSONDecoder().decode(RemoteTicketModel.self, from: jsonData)
                    return remoteTicket
                }
                
                // Filter tiket yang sudah expired (booking_time sebelum hari ini)
                let currentDate = Date() // Tanggal dan waktu saat ini
                let calendar = Calendar.current
                
                let expiredTickets = try remoteTickets.filter { remoteTicket in
                    // Konversi booking_time ke Date
                    let bookingTimeInterval = TimeInterval(remoteTicket.ticket_date) / 1000.0
                    let bookingDate = Date(timeIntervalSince1970: bookingTimeInterval)
                    
                    // Ambil jam dan menit dari field "time"
                    let timeComponents = remoteTicket.ticket_time.components(separatedBy: ":")
                    guard timeComponents.count == 2,
                          let hour = Int(timeComponents[0]),
                          let minute = Int(timeComponents[1]) else {
                        throw NSError(domain: "InvalidTimeFormat", code: -1, userInfo: nil)
                    }
                    
                    // Buat Date dari jam dan menit
                    var bookingTimeComponents = calendar.dateComponents([.year, .month, .day], from: bookingDate)
                    bookingTimeComponents.hour = hour
                    bookingTimeComponents.minute = minute
                    bookingTimeComponents.second = 0
                    
                    guard let bookingTime = calendar.date(from: bookingTimeComponents) else {
                        throw NSError(domain: "InvalidBookingTime", code: -1, userInfo: nil)
                    }
                    
                    // Bandingkan dengan waktu saat ini
                    return bookingTime < currentDate
                }
                
                // Konversi RemoteTicketModel ke TicketEntity
                let ticketEntities = try expiredTickets.map { try $0.toEntity() }
                    .sorted(by: { $0.bookingDate > $1.bookingDate })
                
                // Kembalikan array TicketEntity
                return ticketEntities
            } catch {
                // Lempar error jika terjadi masalah
                throw error
            }
    }
    
    func getTicketDetail(_ id: String) async throws -> TicketEntity {
        throw NSError(domain: "", code: 0, userInfo: nil)
    }
    
    
}
