//
//  TimeItemView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 19/01/25.
//

import SwiftUI

struct TimeItemView: View {
    let time: TimeEntity
    let isSelected: Bool
    let isEnabled: Bool
    
    var body: some View {
        Text(time.asString)
            .foregroundStyle(!isEnabled ? Color(.systemGray4) : isSelected ? Color(.background) : .primary)
            .font(.callout)
            .padding(16)
            .background(!isEnabled ? Color(.systemGray6) : isSelected ? Color(.primary) : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(!isEnabled || isSelected ? .clear : Color(.systemGray3), lineWidth: 1)
            )
    }
}
