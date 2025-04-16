//
//  WalletRepository.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 01/02/25.
//

import Foundation

protocol WalletRepository {
    func getWallet() async throws -> Int
    func topUpWallet(_ amount: Int) async -> Bool
    
}
