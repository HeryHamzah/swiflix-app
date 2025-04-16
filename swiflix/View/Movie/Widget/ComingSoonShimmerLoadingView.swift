//
//  ComingSoonShimmerLoadingView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 09/09/24.
//

import SwiftUI

struct ComingSoonShimmerLoadingView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 200)
                        .shimmeringGray()
                    
                }
                
            }
            .padding(.horizontal, 15)
        }
        .scrollDisabled(true)
    }
}

#Preview {
    ComingSoonShimmerLoadingView()
}
