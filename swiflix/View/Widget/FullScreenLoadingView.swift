//
//  FullScreenLoadingView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 23/01/25.
//

import SwiftUI

struct FullScreenLoadingView: View {
    var body: some View {
        ZStack {
            Color(.onBackground).opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                ProgressView()
                    .scaleEffect(2.5)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(.primary)))
            }
        }
    }
}

#Preview {
    
    ZStack {
        ButtonView(action: {
            
        }, text: "Test Button")
        .padding()
        
        FullScreenLoadingView()

    }
}
