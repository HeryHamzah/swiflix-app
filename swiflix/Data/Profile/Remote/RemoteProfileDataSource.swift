//
//  RemoteProfileDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 06/12/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class RemoteProfileDataSource: ProfileDataSource {
    func getProfile(uid: String) async throws -> UserEntity? {
        let db = Firestore.firestore()
        
        do {
            let snapshot = try await db.collection("users").document(uid).getDocument()
            
            
            guard let data = snapshot.data() else {
                return nil
            }
            
            // Convert the dictionary to JSON data
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            
            let user = try? JSONDecoder().decode(RemoteProfileModel.self, from: jsonData)
            
            return user?.toEntity()
            
        } catch {
            throw error
        }
        
    }
    
    func editProfile(user: UserEntity, photo: Data? = nil) async throws-> UserEntity? {
        let db = Firestore.firestore()
        
        var profilePicPath: String?
        
        if let photo {
            profilePicPath = await DataUtils.uploadProfileImage(image: photo)
        }
        
        let userData: [String: Any] = [
            "uid": user.uid,
            "email": user.email,
            "full_name": user.name,
            "selected_genres": user.selectedGenres?.map({ genre in
                genre.rawValue
            }) ?? [],
            "selected_year": user.selectedYear ?? "",
            "balance": user.balance,
            "favorite_movies": user.favoriteMovies ?? [],
            "profile_picture": profilePicPath ?? user.profilePic ?? ""
        ]
        
        do {
            try await db.collection("users").document(user.uid).setData(userData)
            print("Dokumen berhasil ditambahkan/diperbarui")
            return user.copyWith(profilePic: profilePicPath ?? user.profilePic ?? "")
        } catch {
            print("Error memperbarui dokumen: \(error)")
            return nil
        }
    }
    
    
}
