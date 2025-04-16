//
//  WalletRepositoryImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 01/02/25.
//

import Foundation

class WalletRepositoryImpl: WalletRepository {
    let remoteProfileDataSource: RemoteProfileDataSource
    let localSessionDataSource: LocalSessionDataSource
    let transactionDataSource: TransactionDataSource
    
    init(remoteProfileDataSource: RemoteProfileDataSource, localSessionDataSource: LocalSessionDataSource,
         transactionDataSource: TransactionDataSource) {
        self.remoteProfileDataSource = remoteProfileDataSource
        self.localSessionDataSource = localSessionDataSource
        self.transactionDataSource = transactionDataSource
    }
    
    func getWallet() async throws -> Int {
        do {
            let sessionId = localSessionDataSource.checkSession()
            let userData = try await remoteProfileDataSource.getProfile(uid: sessionId!)
            
            return userData!.balance
        } catch {
            throw error
        }
    }
    
    func topUpWallet(_ amount: Int) async -> Bool {
        do {
            let sessionId = localSessionDataSource.checkSession()
            
            guard let sessionId else {
                return false
            }
            
            let userData = try await remoteProfileDataSource.getProfile(uid: sessionId)
            
            guard let userData else {
                return false
            }
            
            async let isSaveTransaction = transactionDataSource.saveTransaction(amount: amount, desc: nil, picturePath: nil, transactionDateTime: Date(), title: "Top Up Wallet", userId: userData.uid, transactionType: TransactionType.income)
            
           async let userUpdate = remoteProfileDataSource.editProfile(user: userData.copyWith(balance: userData.balance + amount))
            
            let result = await (isSaveTransaction, try userUpdate)
            
            return result.0 &&  result.1 != nil
        } catch {
            return false
        }
    }
    
    
}
