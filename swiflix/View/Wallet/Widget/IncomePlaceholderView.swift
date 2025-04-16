//
//  IncomePlaceholderView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/02/25.
//

import SwiftUI

struct IncomePlaceholderView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color(.animation))
            .frame(width: 70, height: 90)
            .overlay {
                ZStack{
                    Circle()
                        .fill(Color(.systemRed))
                        .frame(width: 25, height: 25)
                        .offset(x: -8)
                    
                    
                    Circle()
                        .fill(Color(.systemOrange).opacity(0.8))
                        .frame(width: 25, height: 25)
                        .offset(x: 8)
                    
                }
                .frame(width: 50, height: 30)
            }
        
    }
}

#Preview {
    IncomePlaceholderView()
}
