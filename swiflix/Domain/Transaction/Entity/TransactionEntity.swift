//
//  TransactionEntity.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/02/25.
//

import Foundation

struct TransactionEntity: Hashable {
    
    let id = UUID()
    let amount: Int
    let picturePath: String?
    let title: String
    let transactionDateTime: Date
    let transactionType: TransactionType
    let description: String?
    
}

let mockTransactions: [TransactionEntity] = [
    TransactionEntity(amount: 500000, picturePath: nil, title: "Gaji Bulanan", transactionDateTime: Date(), transactionType: .income, description: "Gaji bulan Januari"),
    TransactionEntity(amount: 20000, picturePath: "https://example.com/food.jpg", title: "Makan Siang", transactionDateTime: Date(), transactionType: .expense, description: "Makan di warung Padang"),
    TransactionEntity(amount: 150000, picturePath: "https://example.com/shopping.jpg", title: "Belanja Online", transactionDateTime: Date(), transactionType: .expense, description: "Beli kaos di marketplace"),
    TransactionEntity(amount: 75000, picturePath: nil, title: "Bonus Proyek", transactionDateTime: Date(), transactionType: .income, description: "Bonus dari proyek freelance"),
    TransactionEntity(amount: 50000, picturePath: "https://example.com/entertainment.jpg", title: "Nonton Bioskop", transactionDateTime: Date(), transactionType: .expense, description: "Tiket film di bioskop"),
    TransactionEntity(amount: 300000, picturePath: nil, title: "Freelance Design", transactionDateTime: Date(), transactionType: .income, description: "Pembayaran dari klien"),
    TransactionEntity(amount: 120000, picturePath: "https://example.com/transport.jpg", title: "Bensin Motor", transactionDateTime: Date(), transactionType: .expense, description: "Isi bensin full tank"),
    TransactionEntity(amount: 100000, picturePath: nil, title: "THR", transactionDateTime: Date(), transactionType: .income, description: "Tunjangan hari raya dari kantor"),
    TransactionEntity(amount: 25000, picturePath: "https://example.com/subscription.jpg", title: "Langganan Spotify", transactionDateTime: Date(), transactionType: .expense, description: "Bayar Spotify Premium"),
    TransactionEntity(amount: 200000, picturePath: nil, title: "Cashback", transactionDateTime: Date(), transactionType: .income, description: "Cashback dari e-wallet"),
]
