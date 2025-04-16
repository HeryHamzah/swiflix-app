//
//  TopUpWalletUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 01/02/25.
//

import Foundation

class TopUpWalletUseCase {
    let walletRepository: WalletRepository
    
    init(walletRepository: WalletRepository) {
        self.walletRepository = walletRepository
    }
    
    func callAsFunction(amount: Int) async -> Bool {
        return await walletRepository.topUpWallet(amount)
    }
}
