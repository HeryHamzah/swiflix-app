//
//  TransactionRepositoryImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/02/25.
//

import Foundation

class TransactionRepositoryImpl: TransactionRepository {
    let transactionDataSource: TransactionDataSource
    let sessionDataSource: SessionDataSource
    
    init(transactionDataSource: TransactionDataSource, sessionDataSource: SessionDataSource) {
        self.transactionDataSource = transactionDataSource
        self.sessionDataSource = sessionDataSource
    }
    
    func saveTransaction(amount: Int, desc: String?, picturePath: String?, transactionDateTime: Date, title: String, userId: String, transactionType: TransactionType) async -> Bool {
        return await transactionDataSource.saveTransaction(amount: amount, desc: desc, picturePath: picturePath, transactionDateTime: transactionDateTime, title: title, userId: userId, transactionType: transactionType)
    }
    
    func getTransactions() async throws -> [TransactionEntity] {
        
        let sessionId = sessionDataSource.checkSession()
        
        guard let sessionId else {
            return []
        }
        
        return try await transactionDataSource.getTransactions(userId: sessionId)
    }
    
}
