//
//  CheckoutScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/01/25.
//

import SwiftUI

struct CheckoutScreen: View {
    
    @Environment(NavigationManager.self) var navigationManager
    @Environment(ReservationViewModel.self) var reservationViewModel
    @Environment(ProfileViewModel.self) var profileViewModel
    
    var body: some View {
        
        ZStack {
            
            if let profile = profileViewModel.profile {
                VStack {
                    
                    Spacer().frame(height: 20)
                    
                    if let movieDetail = reservationViewModel.movieDetail {
                        HStack {
                            SwiflixRemoteImage(urlString: movieDetail.posterPath ?? "") { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 70, height: 90)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            VStack(alignment: .leading) {
                                Text(movieDetail.title)
                                    .font(.title3)
                                    .fontWeight(.medium)
                                
                                Spacer().frame(height: 6)
                                
                                Text(movieDetail.formattedDetails())
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                                
                                RatingStarWidget(rating: movieDetail.voteAverage, size: 14)
                            }
                            
                            Spacer()
                            
                        }
                    }
                    
                    
                    Spacer().frame(height: 20)
                    
                    Divider()
                    
                    Spacer().frame(height: 20)
                    
                    HStack(alignment: .top) {
                        Text("order_id")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(reservationViewModel.reservationId)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("cinema")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(reservationViewModel.selectedTheater!.name)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("date_and_time")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(reservationViewModel.dateAndTime)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("seat_number")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(reservationViewModel.seatsInString)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("price")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(reservationViewModel.selectedTheater!.ticketPrice.toRupiah() + " x " + reservationViewModel.selectedSeats.count.description)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("fee")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(reservationViewModel.reservationFee.toRupiah() + " x " + reservationViewModel.selectedSeats.count.description)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("total")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(reservationViewModel.totalPayment?.toRupiah() ?? "-")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 20)
                    
                    Divider()
                    
                    Spacer().frame(height: 20)
                    
                    HStack(alignment: .top) {
                        Text("your_wallet")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(profile.balance.toRupiah())
                            .font(.callout)
                            .foregroundStyle(profile.balance > reservationViewModel.totalPayment! ? Color(.animation) : Color(.primary))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 40)
                    
                    ButtonView(
                        action: {
                            guard let totalPayment = reservationViewModel.totalPayment else {
                                print("Invalid data")
                                return
                            }
                            
                            if profile.balance > totalPayment {
                                Task {
                                    await reservationViewModel.reservation()
                                    
                                    if reservationViewModel.isSuccessReservation == true {
                                            navigationManager.navigateToAndRemoveAll(to: .successReservation)
                                        
                                        
                                    } else {
                                      //TODO action jika reservasi gagal
                                    }
                                }
                            } else {
                                navigationManager.navigateTo(to: .topUpWallet)
                            }
                        }
                        , text: profile.balance > reservationViewModel.totalPayment! ? "checkout_now".tr() : "top_up_my_wallet".tr(),
                        backgroundColor: profile.balance > reservationViewModel.totalPayment! ? Color(.animation) : Color(.primary)
                    )
                    
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            
            
            if reservationViewModel.isLoadingReservation || profileViewModel.isLoadingGetProfile {
                FullScreenLoadingView()
            }
        }
        .navigationTitle("checkout_movie")
        
    }
}


#Preview {
    NavigationStack {
        CheckoutScreen()
            .environment(NavigationManager(navigationPath: NavigationPath()))
            .environment(DI.shared.makeProfileViewModel())
            .environment(DI.shared.makeReservationViewModel())
    }
}
