//
//  RegisterScreenViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 18/09/23.
//

import SwiftUI

@Observable class RegisterViewModel{
    
    //value to regist
    var fullName: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var selectedGenres: [GenreEnum] = []
    var selectedMovieRelease: String = "Latest Movies"
    var selectedProfile: Data?
    
    //validator
    var fullNameValidatorError: String? = nil
    var emailValidatorError: String? = nil
    var passwordValidatorError: String? = nil
    var confirmPasswordValidatorError: String? = nil
    
    var isValidate: Bool = false
    
    func validateInput()  {
        fullNameValidatorError = fullName.isEmpty ? "empty_full_name" : nil
        emailValidatorError = emailValidator(email)
        passwordValidatorError = passwordValidator(password: password)
        confirmPasswordValidatorError = confirmPasswordValidator(password: confirmPassword, checkForConfirmPassword: password)
        
        isValidate = emailValidatorError == nil && passwordValidatorError == nil && fullNameValidatorError == nil && confirmPasswordValidatorError == nil
    }
    
    func changeSelectedGenres(genre: GenreEnum) {
        if  selectedGenres.contains(genre) {
            selectedGenres.removeAll(where: { $0 == genre })
        } else {
            if selectedGenres.count < 4 {
                selectedGenres.append(genre)
            }
        }
    }
    
    func changeProfile(_ profile: Data) {
        selectedProfile = profile
    }
    
    func clear() {
         fullName = ""
         email = ""
         password = ""
         confirmPassword = ""
         selectedGenres = []
         selectedMovieRelease = "Latest Movies"
         selectedProfile = nil
        
        //validator
         fullNameValidatorError = nil
         emailValidatorError = nil
         passwordValidatorError = nil
         confirmPasswordValidatorError = nil
        
         isValidate = false
    }
    
}
