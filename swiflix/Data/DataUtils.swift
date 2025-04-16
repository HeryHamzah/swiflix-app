//
//  DataUtils.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/03/25.
//

import Foundation
import FirebaseStorage

struct DataUtils {
    static func uploadProfileImage(image: Data) async -> String? {
        print("Uploading.....")
        
        let uuid = UUID().uuidString
        
        // Create storage reference
        let storageRef = Storage.storage().reference()
        
        // Specify the file path and name
        let fileRef = storageRef.child("profile_picture/\(uuid)")
        
        do {
            // Upload data and wait for the result
            let _ = try await fileRef.putDataAsync(image, metadata: nil)
            
            let downloadURL = try await fileRef.downloadURL().absoluteString
            
            return downloadURL
        } catch {
            print("Error uploading image: \(error.localizedDescription)")
            return nil
        }
    }
}


