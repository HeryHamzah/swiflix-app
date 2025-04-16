//
//  TicketView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 02/02/25.
//

import SwiftUI

struct TicketView: View {
    let ticket: TicketEntity
    
    init(ticket: TicketEntity) {
        self.ticket = ticket
    }
    
    var body: some View {
        HStack  {
            SwiflixRemoteImage(urlString: ticket.moviePosterPath ?? "") { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(width: 70, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Spacer().frame(width: 16)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(ticket.movieName)
                    .font(.title3)
                
                Text("\(ticket.bookingDate.todMMMyyInString()), \(ticket.bookingTime.asString)")
                    .foregroundStyle(.secondary)
                
                Text(ticket.theaterName)
                    .foregroundStyle(.secondary)
                
            }
            .lineLimit(1)
            .truncationMode(.tail)
            
            Spacer()
        }
    }
}

