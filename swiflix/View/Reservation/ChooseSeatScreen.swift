//
//  ChooseSeatScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 19/01/25.
//

import SwiftUI

struct ChooseSeatScreen: View {
    
    @Environment(ReservationViewModel.self) var reservationViewModel
    @Environment(NavigationManager.self) var navigationManager
        
    var body: some View {
        VStack {
            
            Spacer().frame(height: 24)
            
            Image("cinema_screen")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 160)
            
            Spacer().frame(height: 40)
            
            SeatView(
                selectedSeats: reservationViewModel.selectedSeats) { seat in
                    
                    withAnimation {
                        reservationViewModel.changeSelectedSeats(seat: seat)
                    }
                }
            
            Spacer().frame(height: 10)
            
            
            HStack(spacing: 20) {
                HStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(.systemGray3), lineWidth: 1)
                        .frame(width: 20, height: 20)
                    
                    
                    Text("available")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(.systemGray6))
                        .frame(width: 20, height: 20)
                    
                    Text("booked")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(.primary))
                        .frame(width: 20, height: 20)
                    
                    Text("selected")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    
                }
            }
            
            Spacer().frame(height: 30)
            
            
            NextButtonView(isDisabled: reservationViewModel.selectedSeats.isEmpty) {
                    navigationManager.navigateTo(to: .checkout)
            }
            
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 16) {
                    
                    Text(reservationViewModel.movieDetail!.title)
                        .font(.title3)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.6, alignment: .trailing)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    SwiflixRemoteImage(urlString: reservationViewModel.movieDetail!.posterPath ?? "", content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                        
                    }, placeholder: {
                        Color.gray
                    })
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChooseSeatScreen()
            .environment(DI.shared.makeReservationViewModel())
    }
    
}
