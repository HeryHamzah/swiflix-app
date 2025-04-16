//
//  AuthenticationViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/23.
//

import SwiftUI

@MainActor
@Observable
class AuthenticationViewModel {
    
    var isLoggedIn: Bool = false
    var isLoadingAuth: Bool = false
    var isAuthFailed: Bool = false
    var messageError: String?
    
    var authComponent: AuthenticationComponent
    
    init(authComponent: AuthenticationComponent) {
        self.authComponent = authComponent
    }
    
    func signUp(email: String, password: String, name: String, selectedGenres: [GenreEnum],selectedYear: String?, profilePic: Data?) async {
        isLoadingAuth = true
        messageError = nil
        
        do{
            let loggedIn = try await authComponent.signUpUseCase(email: email, password: password, name: name, selectedGenres: selectedGenres, selectedYear: selectedYear, profilePic: profilePic)
            
            isLoggedIn = loggedIn
            isLoadingAuth = false
            isAuthFailed = !loggedIn
            messageError = !loggedIn ? "general_error_message".tr() : nil
        } catch {
            isLoggedIn = false
            isLoadingAuth = false
            isAuthFailed = true
            messageError = error.localizedDescription
        }
    }
    
    func signIn(email: String, password: String) async {
        isLoadingAuth = true
        messageError = nil
        
        do{
            let loggedIn = try await authComponent.signInUseCase(email: email, password: password)
            
            isLoggedIn = loggedIn
            isLoadingAuth = false
            isAuthFailed = !loggedIn
        } catch {
            isLoggedIn = false
            isLoadingAuth = false
            isAuthFailed = true
            messageError = error.localizedDescription
        }
        
    }
    
}


