//
//  TextFieldView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 09/07/24.
//

import SwiftUI

struct TextFieldView: View {
    var title: String
    @Binding var text: String
    var messageValidator: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(title.tr(), text: $text)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .onChange(of: text) { _,newValue in
                    
                    //TODO
                }
            if let message = messageValidator {
                Text(message.tr()).font(.footnote).foregroundColor(Color(.error))
            }
        }
    }
}

#Preview {
    TextFieldView(
        title: "user_id", text: .constant("abc"))
}
