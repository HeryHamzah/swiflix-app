//
//  GetTransactionsUseCase.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/02/25.
//

class GetTransactionsUseCase {
    let transactionRepository: TransactionRepository
    
    init(transactionRepository: TransactionRepository) {
        self.transactionRepository = transactionRepository
    }
    
    func callAsFunction() async throws -> [TransactionEntity] {
        return try await transactionRepository.getTransactions()
    }
}
