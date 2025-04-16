//
//  ContainerChooseView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/08/23.
//

import SwiftUI

struct ContainerChooseView: View {
    
    var value: String
    var isSelected: Bool
    
    var body: some View {
        ZStack{
            Rectangle().frame(width: 170).foregroundColor(isSelected ? Color(.primary) : Color.clear).cornerRadius(10).overlay(
                RoundedRectangle(cornerRadius: 10).stroke(isSelected ? Color.clear : Color(.primary), lineWidth: 1))
            
            Text(value).foregroundColor(isSelected ? Color(.onPrimary) : Color(.primary)).padding(.vertical, 15)
        }
    }
}

struct ContainerChooseView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerChooseView(value: "Mistery", isSelected: true)
    }
}
