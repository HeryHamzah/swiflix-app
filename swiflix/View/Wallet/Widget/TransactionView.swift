//
//  TransactionView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/02/25.
//

import SwiftUI

struct TransactionView: View {
    let transaction: TransactionEntity
    
    var body: some View {
        HStack  {
            
            if transaction.transactionType == TransactionType.income {
                IncomePlaceholderView()
            } else {
                SwiflixRemoteImage(urlString: transaction.picturePath ?? "") { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 70, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            
            Spacer().frame(width: 16)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .font(.title3)
                
                Text((transaction.transactionType == TransactionType.income ? "+" : "-")  + transaction.amount.toRupiah())
                    .foregroundStyle(transaction.transactionType == TransactionType.income ? Color(.animation) : Color(.error))
                
                if let desc = transaction.description {
                    Text(desc)
                        .foregroundStyle(.secondary)
                }
                
                
            }
            .lineLimit(1)
            .truncationMode(.tail)
            
            Spacer()
        }
    }
}

#Preview {
    TransactionView(
        transaction: mockTransactions.first!
    )
}
