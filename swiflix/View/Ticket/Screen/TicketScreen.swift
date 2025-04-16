//
//  TicketScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/01/24.
//

import SwiftUI

enum TicketTab: LocalizedStringKey, CaseIterable {
    case newest
    case expired
}

struct TicketScreen: View {
    
    @State private var selectedTab: TicketTab = .newest
    @State private var ticketListViewModel = DI.shared.makeTicketListViewModel()
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 20)
            
            Picker("", selection: $selectedTab) {
                ForEach(TicketTab.allCases, id: \.self) { tab in
                    Text(tab.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            
            Spacer().frame(height: 20)
            
            TabView(selection: $selectedTab) {
                NewestListView()
                    .tag(TicketTab.newest)
                
                ExpiredListView()
                    .tag(TicketTab.expired)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .environment(ticketListViewModel)
        .task {
            await withTaskGroup(of: Void.self) { group in
                group.addTask { await ticketListViewModel.getNewestTickets() }
                group.addTask { await ticketListViewModel.getExpiredTickets() }
            }
        }
    }
}

#Preview {
    TicketScreen()
        .environment(DI.shared.makeTicketListViewModel())
}
