//
//  PasswordTextField.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 16/07/23.
//

import SwiftUI

struct PasswordTextFieldView: View {
    @Binding var password: String
    @Binding var messageValidator: String?
    @Binding var confirmPassword: String
    
    @State private var isPasswordVisible: Bool = false
    
    var label: String
    var isConfirmPassword: Bool?
    
    init(label: String, password: Binding<String>, messageValidator: Binding<String?> = .constant(nil), confirmPassword: Binding<String>, isConfirmPassword: Bool? = false) {
        _password = password
        _messageValidator = messageValidator
        self.label = label
        _confirmPassword = confirmPassword
        self.isConfirmPassword = isConfirmPassword
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                if isPasswordVisible {
                    TextField(label, text: $password)
                        .autocapitalization(.none)
                        .onChange(of: password) { _,newValue in
                        self.messageValidator = isConfirmPassword! ? confirmPasswordValidator(password: newValue, checkForConfirmPassword: confirmPassword) : passwordValidator(password: newValue)
                    }
                } else {
                    SecureField(label, text: $password)
                        .onChange(of: password) { _,newValue in
                        self.messageValidator = isConfirmPassword! ? confirmPasswordValidator(password: newValue, checkForConfirmPassword: confirmPassword) : passwordValidator(password: newValue)
                    }
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(.gray)
                }
            }
            if  let message = messageValidator {
                Text(message.tr())
                    .font(.footnote)
                    .foregroundColor(Color(.error))
            }
        }
        
    }
}
