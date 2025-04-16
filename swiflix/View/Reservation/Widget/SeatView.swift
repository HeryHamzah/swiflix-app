//
//  SeatView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/01/25.
//

import SwiftUI

struct SeatView: View {
    var selectedSeats: [String]
    var onTap: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(spacing: 20) {
                HStack(spacing: 10) {
                    ForEach(1..<4) { number in
                        let seatName = "A\(number)"
                        SeatItemView(seat: seatName, status: selectedSeats.contains(seatName) ? SeatStatusEnum.selected : SeatStatusEnum.available)
                            .onTapGesture {
                                onTap(seatName)
                            }
                    }
                }
                
                HStack(spacing: 10)  {
                    ForEach(1..<8) { number in
                        let seatName = "B\(number)"
                        SeatItemView(seat: seatName, status: selectedSeats.contains(seatName) ? SeatStatusEnum.selected : SeatStatusEnum.available)
                            .onTapGesture {
                                onTap(seatName)
                            }
                    }
                }
                
                HStack(spacing: 10)  {
                    ForEach(1..<8) { number in
                        let seatName = "C\(number)"
                        SeatItemView(seat: seatName, status: selectedSeats.contains(seatName) ? SeatStatusEnum.selected : SeatStatusEnum.available)
                            .onTapGesture {
                                onTap(seatName)
                            }
                    }
                }
                
                HStack(spacing: 10)  {
                    ForEach(1..<8) { number in
                        let seatName = "D\(number)"
                        SeatItemView(seat: seatName, status: selectedSeats.contains(seatName) ? SeatStatusEnum.selected : SeatStatusEnum.available)
                            .onTapGesture {
                                onTap(seatName)
                            }
                    }
                }
                
                HStack(spacing: 10)  {
                    ForEach(1..<8) { number in
                        let seatName = "E\(number)"
                        SeatItemView(seat: seatName, status: selectedSeats.contains(seatName) ? SeatStatusEnum.selected : SeatStatusEnum.available)
                            .onTapGesture {
                                onTap(seatName)
                            }
                    }
                }
                
                HStack(spacing: 10)  {
                    ForEach(1..<8) { number in
                        let seatName = "F\(number)"
                        SeatItemView(seat: seatName, status: selectedSeats.contains(seatName) ? SeatStatusEnum.selected : SeatStatusEnum.available)
                            .onTapGesture {
                                onTap(seatName)
                            }
                    }
                }
                
                HStack(spacing: 10)  {
                    ForEach(1..<8) { number in
                        let seatName = "G\(number)"
                        SeatItemView(seat: seatName, status: selectedSeats.contains(seatName) ? SeatStatusEnum.selected : SeatStatusEnum.available)
                            .onTapGesture {
                                onTap(seatName)
                            }
                    }
                }
                
            }
        }
        .padding(.horizontal, -20)
        .scrollIndicators(.hidden)
        .defaultScrollAnchor(.center)
    }
}

#Preview {
    SeatView(
        selectedSeats: ["A1", "B1", "E2", "G7"]) { seatName in
            
        }
}
