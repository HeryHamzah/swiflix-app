import SwiftUI

struct FullNameTextFieldView: View {
    @Binding var fullName: String
    @Binding var messageValidator: String?
    
    
    init(fullName: Binding<String>, messageValidator: Binding<String?> = .constant(nil)) {
        _fullName = fullName
        _messageValidator = messageValidator
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("full_name".tr(), text: $fullName)
                .autocapitalization(.words)
                .autocorrectionDisabled()
                .onChange(of: fullName) {  _,newValue  in
                    self.messageValidator = newValue.isEmpty ? "empty_full_name" : nil
                }
            if let message = messageValidator {
                
                Text(message.tr()).font(.footnote).foregroundColor(Color(.error))
                
            }
        }
    }
}


