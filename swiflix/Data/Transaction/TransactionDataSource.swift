//
//  TickeDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/01/25.
//

import Foundation

protocol TransactionDataSource {
    func saveTransaction(amount: Int, desc: String?, picturePath: String?, transactionDateTime: Date, title: String, userId: String, transactionType: TransactionType) async -> Bool
    
    func getTransactions(userId: String) async throws -> [TransactionEntity]
}
