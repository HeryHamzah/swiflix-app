import SwiftUI

struct RegisterScreen: View {
    
    @Environment(RegisterViewModel.self) private var registerViewModel
    @Environment(NavigationManager.self) var navigationManager
    
    var body: some View {
        @Bindable var regist = registerViewModel
        
        VStack() {
            
            Spacer().frame(height: 50)
            
            ProfilePicView { newImage in
                if let image = newImage {
                    registerViewModel.changeProfile(image)
                }
            }
            
            Spacer().frame(height: 50)
            
            FullNameTextFieldView(fullName: $regist.fullName, messageValidator: $regist.fullNameValidatorError)
            
            Spacer().frame(height: 30)
            
            EmailTextFieldView(email: $regist.email, messageValidator: $regist.emailValidatorError)

            Spacer().frame(height: 30)

            PasswordTextFieldView(label: "password".tr(), password: $regist.password, messageValidator: $regist.passwordValidatorError, confirmPassword: .constant(""))

            Spacer().frame(height: 30)

            PasswordTextFieldView(label: "confirm_password".tr(), password: $regist.confirmPassword, messageValidator:  $regist.confirmPasswordValidatorError, confirmPassword: $regist.password, isConfirmPassword: true)
            
            Spacer().frame(height: 80)
            
            NextButtonView {
                registerViewModel.validateInput();
                
                if registerViewModel.isValidate {
                    navigationManager.navigateTo(to: .chooseFavorite)
                }
            }
            
            Spacer()
            
        }
        .padding()
    }
}


