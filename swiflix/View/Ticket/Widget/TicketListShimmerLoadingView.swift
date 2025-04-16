//
//  TicketListShimmerView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 06/02/25.
//

import SwiftUI

struct TicketListShimmerLoadingView: View {
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            
            ScrollView {
                
                LazyVStack( spacing: 20) {
                    ForEach(0..<15) { _ in
                        
                        HStack  {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 70, height: 90)
                            
                            Spacer().frame(width: 16)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(maxWidth: width / 1.5, maxHeight: 20)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(maxWidth: width / 3, maxHeight: 18)

                                RoundedRectangle(cornerRadius: 4)
                                    .frame(maxWidth: width / 2, maxHeight: 18)

                                
                            }
                            
                            Spacer()
                        }
                        .shimmeringGray()
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollDisabled(true)

            
        }
    }
}

#Preview {
    TicketListShimmerLoadingView()
        .padding(.horizontal, 20)
}
