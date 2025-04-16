//
//  ReservationScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 15/01/25.
//

import SwiftUI

struct ReservationScreen: View {
    let movieDetail: MovieDetailEntity
    
    @Environment(ReservationViewModel.self) var reservationViewModel
    @Environment(NavigationManager.self) var navigatorManager
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 24)
            
            //DATE PICKER
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(reservationViewModel.dates, id: \.self) { date in
                        DateItemView(date: date, isSelected: date == reservationViewModel.selectedDate)
                            .onTapGesture {
                                withAnimation(.smooth) {
                                    reservationViewModel.changeSelectedDate(to: date)
                                }
                            }
                            .padding(.leading, date == reservationViewModel.dates.first ? 20 : 0)
                            .padding(.trailing, date == reservationViewModel.dates.last ? 20 : 0)
                    }
                }
            }
            .defaultScrollAnchor(.center)
            .scrollIndicators(.hidden)
            .padding(.vertical, 20)
            .background(Color(.primary).opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 20)
            
            Spacer().frame(height: 24)
            
            //THEATER LIST
            VStack(spacing: 24) {
                ForEach(reservationViewModel.theaters) { theater in
                    
                    VStack(alignment: .leading) {
                        Text(theater.name)
                            .font(.title3)
                            .padding(.horizontal, 20)
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(theater.schedules) { time in
                                    let isEnabled = Calendar.current.isTimeEnabled(time: time, for: reservationViewModel.selectedDate)
                                    
                                    let isSelected = time == reservationViewModel.selectedTime && theater == reservationViewModel.selectedTheater
                                    
                                    TimeItemView(time: time, isSelected: isSelected, isEnabled: isEnabled)
                                        .onTapGesture {
                                            withAnimation {
                                                reservationViewModel.changeSelectedTheater(theater: theater, time: time)
                                            }
                                        }
                                        .disabled(!isEnabled)
                                        .padding(.leading, time == theater.schedules.first ? 20 : 0)
                                        .padding(.trailing, time == theater.schedules.last ? 20 : 0)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    
                }
            }
            
            Spacer().frame(height: 40)
            
            
            //NEXT BUTTON
            NextButtonView (isDisabled: reservationViewModel.selectedTheater == nil || reservationViewModel.selectedTime == nil){
                navigatorManager.navigateTo(to: .chooseSeat)
            }
            
            Spacer()
        }
        .navigationTitle(movieDetail.title)
        .toolbarTitleDisplayMode(.inline)
        .onAppear {
            reservationViewModel.setNewData(movieDetail: movieDetail)
        }
    }
}

#Preview {
    NavigationStack {
        ReservationScreen(
            movieDetail: mockMovieDetail)
    }
    .environment(DI.shared.makeReservationViewModel())
    .environment(NavigationManager(navigationPath: NavigationPath()))
    
}
