//
//  ReservationRepositoryImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/01/25.
//

import Foundation

class ReservationRepositoryImpl: ReservationRepository {
    let remoteTransactionDataSource: RemoteTransactionDataSource
    let remoteTicketDataSource: RemoteTicketDataSource
    let remoteProfileDataSource: RemoteProfileDataSource
    let localSessionDataSource: LocalSessionDataSource
    
    init(remoteTransactionDataSource: RemoteTransactionDataSource, remoteTicketDataSource: RemoteTicketDataSource, remoteProfileDataSource: RemoteProfileDataSource, localSessionDataSource: LocalSessionDataSource) {
        self.remoteTicketDataSource = remoteTicketDataSource
        self.remoteTransactionDataSource = remoteTransactionDataSource
        self.remoteProfileDataSource = remoteProfileDataSource
        self.localSessionDataSource = localSessionDataSource
    }
    
    func reservation(reservation: ReservationEntity, totalPrice: Int, movieDetail: MovieDetailEntity) async -> Bool {
        
        let transactionDateTime = Date()
        
        do {
            let sessionId = localSessionDataSource.checkSession()
            
            guard let sessionId else {
                return false
            }
            
            let userData = try await remoteProfileDataSource.getProfile(uid: sessionId)
            
            guard let userData else {
                return false
            }
            
            async let isSaveTicket = remoteTicketDataSource.saveTicket(theaterName: reservation.theater.name, ticketDate: reservation.date, ticketTime: reservation.time, transactionDateTime: transactionDateTime, movieName: movieDetail.title, moviePosterPath: movieDetail.posterPath, orderId: reservation.id, seats: reservation.seats, totalPrice: totalPrice, userId: userData.uid, username: userData.name)
            
            async let isSaveTransaction = remoteTransactionDataSource.saveTransaction(amount: totalPrice, desc: reservation.theater.name, picturePath: movieDetail.posterPath, transactionDateTime: transactionDateTime, title: movieDetail.title, userId: userData.uid, transactionType: TransactionType.expense)
            
           async let user = remoteProfileDataSource.editProfile(user: userData.copyWith(balance: userData.balance - totalPrice))
            
            let (results) = await (isSaveTicket, isSaveTransaction, try user)
            
            return results.0 && results.1 && results.2 != nil
            
        }
        catch {
            return false
        }
        
    }
    
    
}
