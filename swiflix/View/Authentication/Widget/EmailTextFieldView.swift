import SwiftUI

struct EmailTextFieldView: View {
    @Binding var email: String
    @Binding var messageValidator: String?
    
    init(email: Binding<String>, messageValidator: Binding<String?> = .constant(nil)) {
        _email = email
        _messageValidator = messageValidator
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("email".tr(), text: $email)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .onChange(of: email) { _,newEmail in
                    self.messageValidator = emailValidator(newEmail)
                }
            if let message = messageValidator {
                Text(message.tr()).font(.footnote).foregroundColor(Color(.error))
            }
        }
    }
}

