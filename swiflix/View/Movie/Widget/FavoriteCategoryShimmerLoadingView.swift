//
//  FavoriteCategoryShimmerLoadingView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 09/09/24.
//

import SwiftUI

struct FavoriteCategoryShimmerLoadingView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 170), alignment: .leading)], spacing: 16) {
            ForEach(0..<4) { _ in
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 49)
                    .shimmeringGray()
            }
        }
    }
}

#Preview {
    FavoriteCategoryShimmerLoadingView()
}
