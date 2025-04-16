//
//  MyWalletViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/02/25.
//

import Foundation

@Observable class MyWalletViewModel {
    let getTransactionsUseCase: GetTransactionsUseCase
    
    var isLoadingGetTransactions = false
    var transactions: [TransactionEntity] = []
    
    init(getTransactionsUseCase: GetTransactionsUseCase) {
        self.getTransactionsUseCase = getTransactionsUseCase
    }
    
    func getTransactions() async  {
        isLoadingGetTransactions = true
        
        
        do {
            transactions = try await getTransactionsUseCase()
            
            isLoadingGetTransactions = false
            
        } catch {
            isLoadingGetTransactions = false
        }
        
    }
}
