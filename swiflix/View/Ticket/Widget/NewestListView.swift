//
//  NewestListView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 02/02/25.
//

import SwiftUI

struct NewestListView: View {
    
    @Environment(TicketListViewModel.self) var ticketListViewModel
    @Environment(NavigationManager.self) var navigationManager
    
    var body: some View {
        
        if ticketListViewModel.isLoadingGetNewestTickets {
            TicketListShimmerLoadingView()
        } else if !ticketListViewModel.newestTickets.isEmpty {
            ScrollView {
                
                VStack(spacing: 20) {
                    ForEach(ticketListViewModel.newestTickets, id: \.self) { ticket in
                        TicketView(ticket: ticket)
                            .onTapGesture {
                                navigationManager.navigateTo(to: .ticketDetail(ticket: ticket))
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)
            
        } else {
            VStack {
                Image("no_data")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                Spacer().frame(height: 20)
                
                Text("no_data")
                    .font(.title3)
                
            }
        }
        
    }
}

#Preview {
    NewestListView()
}
