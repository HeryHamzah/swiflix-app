//
//  RemoteTransactionModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/02/25.
//

import Foundation

struct RemoteTransactionModel: Decodable {
    let amount: Int
    let desc: String?
    let picture_path: String?
    let title: String
    let transaction_date_time: Int
    let transaction_type: String
    
    func toEntity() -> TransactionEntity {
        return TransactionEntity(amount: amount,
                                 picturePath: picture_path,
                                 title: title,
                                 transactionDateTime: Date(timeIntervalSince1970: TimeInterval(transaction_date_time) / 1000.0),
                                 transactionType: TransactionType(rawValue: transaction_type)!,
                                 description: desc)
    }
}
