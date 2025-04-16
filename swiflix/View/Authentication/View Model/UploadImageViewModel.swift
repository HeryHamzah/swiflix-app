//
//  UploadImageViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 26/02/24.
//

import Foundation


@Observable class UploadImageViewModel {
    var uploadImageUseCase: UploadImageUseCase
    
    init(uploadImageUseCase: UploadImageUseCase) {
        self.uploadImageUseCase = uploadImageUseCase
    }
}
