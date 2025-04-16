//
//  MovieDetailShimmerLoadingView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/01/25.
//

import SwiftUI

struct MovieDetailShimmerLoadingView: View {
    var body: some View {
        
        let padding: Double = 20

        GeometryReader { geo in
            let height = geo.size.height
            let width = geo.size.width
            
            ScrollView {
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: height / 2)
                            .shimmeringGray()
                            .padding(.horizontal, -padding)
                        
                        Spacer().frame(height: 20)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: (width - 2 * padding) / 2, height: 30)
                            .shimmeringGray()
                        
                        Spacer().frame(height: 10)
                        
                        VStack(alignment: .leading) {
                            ForEach(0..<3) { _ in
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(height: 20)
                                    .shimmeringGray()
                            }
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: (width - 2 * padding) / 1.5, height: 20)
                                .shimmeringGray()
                        }
                        
                        Spacer().frame(height:20)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: (width - 2 * padding) / 2, height: 30)
                            .shimmeringGray()
                        
                        Spacer().frame(height:10)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<5) { _ in
                                    RoundedRectangle(cornerRadius: 16)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .shimmeringGray()
                                }          
                            }
                        }
                        .padding(.trailing, -padding)
                        .scrollDisabled(true)
                        
                        Spacer().frame(height:40)
                        
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: buttonHeight)
                            .shimmeringGray()

                        
                    }
                    .padding(.horizontal, padding)

                }
            .scrollDisabled(true)
        }
        
    }
}

#Preview {
    MovieDetailShimmerLoadingView()
}
