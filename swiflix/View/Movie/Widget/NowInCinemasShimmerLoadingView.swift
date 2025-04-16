//
//  NowInCinemasShimmerLoadingView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 09/09/24.
//

import SwiftUI

struct NowInCinemasShimmerLoadingView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 250, height: 150)
                        .shimmeringGray()
                }
            }
            .padding(.horizontal, 15)
            
        }
        .scrollDisabled(true)
    }
}

#Preview {
    NowInCinemasShimmerLoadingView()
}
