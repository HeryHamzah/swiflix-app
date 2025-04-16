//
//  SeatItemView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/01/25.
//

import SwiftUI
struct SeatItemView: View {
    let seat: String
    let status: SeatStatusEnum
    
    var body: some View {
        Text(seat)
            .font(.callout)
            .foregroundColor(status == SeatStatusEnum.selected ? Color(.background) : status == SeatStatusEnum.booked ? Color(.systemGray4) : Color .primary)
            .frame(width: 40, height: 40)
            .background(status == SeatStatusEnum.selected ? Color(.primary) : status == SeatStatusEnum.booked ? Color(.systemGray6) : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(status == SeatStatusEnum.selected ? .clear :  Color(.systemGray3), lineWidth: 1)
            }
        
        
    }
}

#Preview {
    SeatItemView(seat: "A1", status: SeatStatusEnum.available)
}
