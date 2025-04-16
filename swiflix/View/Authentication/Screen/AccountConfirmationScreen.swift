//
//  AccountConfirmationScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 30/10/23.
//

import SwiftUI

struct AccountConfirmationScreen: View {
    @Environment(RegisterViewModel.self) var registerViewModel
    @Environment(AuthenticationViewModel.self) var authViewModel
    @Environment(NavigationManager.self) var navigationManager
    
    var body: some View {
        @Bindable var authViewModel = authViewModel
        
        VStack{
            Spacer().frame(height: 40)
            if let profile = registerViewModel.selectedProfile, let uiImage = UIImage(data: profile)
            {
                Image(uiImage: uiImage).resizable().frame(width: 100, height: 100).clipShape(Circle())
                    .overlay(Circle().stroke(Color(.primary), lineWidth: 4))
            }
            else {
                Image("profile_icon").resizable().frame(width: 100, height: 100).clipShape(Circle())
                    .overlay(Circle().stroke(Color(.primary), lineWidth: 4))
            }
            
            Text("\("welcome".tr()),").font(.title)
            Text(registerViewModel.fullName).font(.title3)
            
            Spacer()
            
            Group {
                if (authViewModel.isLoadingAuth) {
                    
                    ProgressView()
                        .scaleEffect(x: 2, y: 2, anchor: .center)
                        .frame(height: 49)
                } else {
                    ButtonView(action: {
                        Task{
                            await authViewModel.signUp(email: registerViewModel.email, password: registerViewModel.password, name: registerViewModel.fullName, selectedGenres: registerViewModel.selectedGenres, selectedYear: registerViewModel.selectedMovieRelease, profilePic: registerViewModel.selectedProfile
                            )
                            
                            if authViewModel.isLoggedIn {
                                navigationManager.navigateToAndRemoveAll(to: .home)
                            }
                        }
                    }, text: "register".tr())
                }
            }
            
            Spacer()
            
        }
        .padding()
        .navigationBarTitle("confirmation", displayMode: .inline)
        .alert(isPresented: $authViewModel.isAuthFailed) {
            Alert(
                title: Text("failed".tr()),
                message: Text(authViewModel.messageError!)
            )
        }
        
    }
}


#Preview {
    AccountConfirmationScreen()
        .environment(RegisterViewModel())
        .environment(DI.shared.makeAuthenticationViewModel())
}
