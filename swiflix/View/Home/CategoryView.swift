//
//  CategoryView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/02/24.
//

import SwiftUI

struct CategoryView: View {
    var value: GenreEnum
    
    var body: some View {
        ZStack{
            Rectangle().frame(width: 170).foregroundColor(getColor(genre: value)).cornerRadius(10)
            
            Text(value.rawValue.tr()).foregroundColor(Color(.onPrimary)).padding(.vertical, 15)
        }
    }
}




#Preview {
    CategoryView(value: GenreEnum.romance)
}
