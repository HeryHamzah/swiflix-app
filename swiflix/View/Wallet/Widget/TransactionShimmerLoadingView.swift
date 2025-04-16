//
//  TransactionShimmerLoadingView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 21/02/25.
//

import SwiftUI

struct TransactionShimmerLoadingView: View {
    
    var body: some View {
        
        GeometryReader { geo in
            HStack  {
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 70, height: 90)
                    .shimmeringGray()
                
                Spacer().frame(width: 16)
                
                VStack(alignment: .leading, spacing: 4) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(maxWidth: geo.size.width / 2)
                        .frame(height: 18)
                        .shimmeringGray()
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(maxWidth: geo.size.width / 3)
                        .frame(height: 18)
                        .shimmeringGray()
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: .infinity, height: 18)
                        .frame(maxWidth: geo.size.width / 1.5)
                        .frame(height: 18)
                        .shimmeringGray()
                    
                }
                
                Spacer()
            }
        }
        .frame(height: 90)
       
    }
}

#Preview {
    TransactionShimmerLoadingView()
}
