//
//  RatingStarWidget.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 26/12/24.
//

import SwiftUI

struct RatingStarWidget: View {
    let rating: Double
    let size: CGFloat
    
    init(rating: Double, size: CGFloat = 20) {
        self.rating = min(max(rating, 0), 10)
        self.size = size
    }
    
    private var normalizedRating: Double {
        (rating / 10) * 5
    }
    
    var body: some View {
        HStack {
            Text(String(format: "%.1f", rating))
                .font(.system(size: size))
                .bold()
                .foregroundStyle(.yellow)
            ForEach(0..<5) { index in
                
                if Double(index) < floor(normalizedRating) {
                    // Full Star
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: size, height: size)
                        .foregroundColor(.yellow)
                } else if Double(index) < normalizedRating {
                    // Half Star
                    Image(systemName: "star.leadinghalf.filled")
                        .resizable()
                        .scaledToFit()
                        .frame(width: size, height: size)
                        .foregroundColor(.yellow)
                } else {
                    // Empty Star
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: size, height: size)
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}


#Preview {
    RatingStarWidget(rating: 5, size: 20)
}
