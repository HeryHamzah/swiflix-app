//
//  TopUpWalletViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 01/02/25.
//

import Foundation

@Observable class TopUpWalletViewModel {
    let topUpWalletUseCase: TopUpWalletUseCase
    
    init(topUpWalletUseCase: TopUpWalletUseCase) {
        self.topUpWalletUseCase = topUpWalletUseCase
    }
    
    var amount: String = ""
    var isLoadingTopUp = false
    var isSuccessTopUp: Bool?
    var showAlert = false
    
    
    var amountInt : Int? {
        return convertFormattedCurrencyToInt(amount)
    }
    
    var isAmountValid: Bool {
        guard let amountInt else { return false }
        return amountInt > 0
    }
    
    
    func changeAmount(_ amount: String) {
        self.amount = formatCurrency(amount)
    }
    
    func topUpWallet() async {
        isLoadingTopUp = true
        isSuccessTopUp = nil
        showAlert = false
        
        guard let amountInt else {
            isLoadingTopUp = false
            isSuccessTopUp = false
            showAlert = true
            return
        }
        
        isSuccessTopUp =  await topUpWalletUseCase(amount: amountInt)
        isLoadingTopUp = false
        
        if isSuccessTopUp == false {
            showAlert = true
        }
    }
}
