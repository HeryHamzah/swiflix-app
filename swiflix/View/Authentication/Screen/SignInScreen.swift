//
//  SignInScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/08/23.
//

import SwiftUI

struct SignInScreen: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emailValidatorError: String? = nil
    @State private var passwordValidatorError: String? = nil
    
    @Environment(AuthenticationViewModel.self) var authViewModel
    @Environment(NavigationManager.self) var navigationManager
    
    func validateInput() -> Bool {
        emailValidatorError = emailValidator(email)
        passwordValidatorError = passwordValidator(password: password)
        
        return emailValidatorError == nil && passwordValidatorError == nil
    }
    
    var body: some View {
        @Bindable var authViewModel = authViewModel
        
        VStack(alignment: .leading){

            Text("welcome_back".tr()).font(.title2)
            Text("the_cinema_is_waiting_for_you").font(.title3)
            Spacer().frame(height: 20)
            
            Group{
                EmailTextFieldView(email: $email, messageValidator: $emailValidatorError).padding(.bottom, 30)
                
            PasswordTextFieldView(label: "password".tr(), password: $password, messageValidator: $passwordValidatorError, confirmPassword: .constant("")).padding(.bottom, 30)
                
            }
            .submitScope()
            
            HStack{
                Text("forgot_password".tr())
                NavigationLink(destination: ResetPasswordScreen()){
                    Text("reset_password".tr()).foregroundColor(Color(.primary))
                }
                
            }
            
            Spacer().frame(height: 80)
            
            HStack{
                Text("start_fresh_now".tr())
                NavigationLink(destination: RegisterScreen()){
                    Text("register".tr()).foregroundColor(Color(.primary))
                }
                
            }.frame(maxWidth: .infinity, alignment: .center)
            
            Spacer().frame(height: 20)
            

                if authViewModel.isLoadingAuth{
                    GeometryReader{
                        geo in
                        ProgressView().frame(width: geo.size.width , alignment: .center)
                    }
                }else{                    
                    Button(action: {
                        if validateInput() {
                            Task{
                                await authViewModel.signIn(email: email, password: password)
                                
                                
                                if authViewModel.isLoggedIn {
                                    navigationManager.navigateToAndRemoveAll(to: .home)
                                }
                            }
                        }
                       
                    }) {
                        Text("sign_in".tr())
                            .foregroundColor(Color(.onPrimary))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.primary))
                            .cornerRadius(8)
                    }.alert(isPresented: $authViewModel.isAuthFailed) {
                        Alert(
                            title: Text("failed".tr()),
                            message: Text(authViewModel.messageError!)
                        )
                    }
                }

                 
            Spacer()
            
        }
        .padding()
                
    }
}


struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
