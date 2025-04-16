//
//  TransactionRepository.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/02/25.
//

import Foundation

protocol TransactionRepository {
    
    func saveTransaction(amount: Int, desc: String?, picturePath: String?, transactionDateTime: Date, title: String, userId: String, transactionType: TransactionType) async -> Bool
    
    func getTransactions() async throws -> [TransactionEntity]
}
