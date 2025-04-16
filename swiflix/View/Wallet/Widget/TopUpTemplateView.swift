//
//  TopUpTemplateView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 01/02/25.
//

import SwiftUI

struct TopUpTemplateView: View {
    let value: Int
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Text("IDR")
                .foregroundStyle(isSelected ? Color(.background) : .secondary)
            Spacer().frame(height: 8)
            Text(value.toRupiahWithoutSymbol())
                .font(.callout)
                .foregroundStyle(isSelected ? Color(.background) : .primary)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(isSelected ? Color(.animation) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? Color(.animation) : Color(.systemGray3), lineWidth: 1)
        }
    }
}
