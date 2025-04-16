//
//  ForYouShimmerLoadingView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 09/09/24.
//

import SwiftUI

struct ForYouShimmerLoadingView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 300, height: 400)
                        .shimmeringGray()
                }
                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                    view
                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                }
            }
            .padding(15)
            .scrollTargetLayout()
        }
        .scrollDisabled(true)
    }
}

#Preview {
    ForYouShimmerLoadingView()
}
