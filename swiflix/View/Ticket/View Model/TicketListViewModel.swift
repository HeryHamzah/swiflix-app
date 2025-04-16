//
//  TicketListViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 02/02/25.
//

import Foundation

@MainActor
@Observable
class TicketListViewModel {
    let getNewestTicketsUseCase: GetNewestTicketsUseCase
    let getExpiredTicketsUseCase: GetExpiredTicketsUseCase
    
    init(getNewestTicketsUseCase: GetNewestTicketsUseCase, getExpiredTicketsUseCase: GetExpiredTicketsUseCase) {
        self.getNewestTicketsUseCase = getNewestTicketsUseCase
        self.getExpiredTicketsUseCase = getExpiredTicketsUseCase
    }
    
    var isLoadingGetNewestTickets: Bool = false
    var isLoadingGetExpiredTickets: Bool = false
    
    var isErrorGetNewestTickets: Error?
    var isErrorGetExpiredTickets: Error?
    
    var newestTickets: [TicketEntity] = []
    var expiredTickets: [TicketEntity] = []
    
    func getNewestTickets() async {

        isLoadingGetNewestTickets = true
        isErrorGetNewestTickets = nil
        
        do {
            
            let tickets =  try await getNewestTicketsUseCase()
            
            newestTickets = tickets
            isLoadingGetNewestTickets = false
            
        } catch {
            
            isErrorGetNewestTickets = error
            isLoadingGetNewestTickets = false
            
        }
        
    }
    
    func getExpiredTickets() async {
        
        isLoadingGetExpiredTickets = true
        isErrorGetExpiredTickets = nil
        
        do {
            let tickets = try await getExpiredTicketsUseCase()
            
            expiredTickets = tickets
            isLoadingGetExpiredTickets = false
            
        } catch {
            
            isErrorGetExpiredTickets = error
            isLoadingGetExpiredTickets = false
            
        }
    }
}
