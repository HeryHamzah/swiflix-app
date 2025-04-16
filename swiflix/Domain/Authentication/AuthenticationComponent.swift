//
//  AuthenticationComponent.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 15/10/23.
//

import Foundation

class AuthenticationComponent{
    var signUpUseCase: SignUpUseCase
    var signInUseCase: SignInUseCase
    var uploadImageUseCase: UploadImageUseCase
    
    init(authRepository: AuthenticationRepository) {
        signUpUseCase = SignUpUseCase(authenticationRepository: authRepository)
        signInUseCase = SignInUseCase(authenticationRepository: authRepository)
        uploadImageUseCase = UploadImageUseCase(authenticationRepository: authRepository)
    }
    
}
