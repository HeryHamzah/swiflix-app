//
//  RemoteTicketDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/01/25.
//

import FirebaseFirestore

class RemoteTransactionDataSource: TransactionDataSource {
  
    
    func saveTransaction(amount: Int, desc: String?, picturePath: String?, transactionDateTime: Date, title: String, userId: String, transactionType: TransactionType) async -> Bool {
        
        let db = Firestore.firestore()
        
        let transactionData: [String: Any] = [
            "amount": amount,
            "desc": desc as Any,
            "picture_path": picturePath as Any,
            "transaction_date_time": transactionDateTime.millisecondsSinceEpoch,
            "title": title,
            "user_id": userId,
            "transaction_type": String(describing: transactionType)
        ]
        
        let docRef = db.collection("transactions").document()
           do {
               try await docRef.setData(transactionData)
               print("Document successfully written!")
               return true
           } catch {
               print("Error writing document: \(error)")
               return false
           }
    
    }
    
    func getTransactions(userId: String) async throws -> [TransactionEntity] {
        do {
            let db = Firestore.firestore()

            let querySnapshot = try await db
                .collection("transactions")
                .whereField("user_id", isEqualTo: userId)
                .getDocuments()
            
            
            let remoteTransactions = try querySnapshot.documents.compactMap { document in
                let data = document.data()
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                let remoteTransaction = try JSONDecoder().decode(RemoteTransactionModel.self, from: jsonData)
                return remoteTransaction
            }
            
            let transactionEntities = remoteTransactions.map { $0.toEntity() }
                .sorted(by: { $0.transactionDateTime > $1.transactionDateTime })
            
            return transactionEntities
        }
        catch {
            return []
        }
    }

}
