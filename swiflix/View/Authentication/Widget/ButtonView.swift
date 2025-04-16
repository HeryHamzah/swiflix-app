//
//  ButtonView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 16/07/23.
//

import SwiftUI

struct ButtonView: View {
    
    var action: () -> Void
    var text: String
    var backgroundColor: Color = Color(.primary)
    var isDisabled: Bool = false
    
    var body: some View {
        Button(action : action) {
            Text(text)
                .foregroundStyle(isDisabled ? Color(.systemGray4) : Color(.onPrimary))
                .padding()
                .frame(maxWidth: .infinity)
                .background(isDisabled ? Color(.systemGray6) : backgroundColor)
                .cornerRadius(8)
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.5 : 1.0)

    }
}

struct NextButtonView: View {
    var isDisabled: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            if !isDisabled {
                action()
            }
        }) {
            Circle()
                .fill(isDisabled ? Color(.systemGray6) : Color(.primary))
                .frame(width: 70, height: 70)
                .overlay(
                    Image(systemName: "arrowshape.right")
                        .resizable()
                        .padding(20)
                        .scaledToFit()
                        .foregroundStyle(isDisabled ? Color(.systemGray4) : Color(.onPrimary)))
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.5 : 1.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextButtonView(action: {
            
        })
    }
}

