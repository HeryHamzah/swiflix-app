//
//  DateItemView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 16/01/25.
//

import SwiftUI

struct DateItemView: View {
    let date: Date
    let isSelected: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(date.getDay())")
                .font(.title3)
                .bold()
            
            Text(date.dayName().prefix(2).uppercased())
                .font(.body)
                .fontWeight(.light)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .foregroundStyle(isSelected ? Color(.background) : Color(.onBackground))
        .background(isSelected ? Color(.primary) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

