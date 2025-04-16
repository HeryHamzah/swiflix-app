//
//  ShimmerEffectModifier.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 16/06/24.
//

import SwiftUI


//Shimmer effect custom view modifier
extension View {
    @ViewBuilder
    func shimmeringGray() -> some View {
        self
            .shimmering(gradient: Gradient(colors: [.gray, .gray.opacity(0.7), .gray.opacity(0.5), .gray.opacity(0.3)]), mode: .overlay())
    }
}
