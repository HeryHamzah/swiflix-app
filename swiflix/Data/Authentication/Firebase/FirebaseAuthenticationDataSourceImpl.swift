//
//  FirebaseDataSourceImpl.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation
import Firebase
import FirebaseStorage

class FirebaseAuthenticationDataSourceImpl: AuthenticationDataSource {
    var sessionComponent: SessionComponent
    
    init(sessionComponent: SessionComponent) {
        self.sessionComponent = sessionComponent
    }
    
    func signUp(email: String, password: String,  name: String, selectedGenres: [GenreEnum], selectedYear: String?, profilePic: Data?) async throws -> Bool {
        
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Sign-up successful, UID: \(authResult.user.uid)")
            
            var profilePicPath: String?
            
            if let profilePic {
                profilePicPath = await uploadImage(image: profilePic)
                
            }
            
            let isCreateUser: Bool  =  try await createOrUpdateUser(user: UserEntity(uid: authResult.user.uid, name: name, email: email,profilePic: profilePicPath, selectedGenres: selectedGenres, selectedYear: selectedYear, balance: 0))
            
            if(!isCreateUser) {
                try await authResult.user.delete()
                
                return false
            }
            
            sessionComponent.saveSessionUseCase(userId: authResult.user.uid)
            
            
            return true
        } catch {
            print("Sign-up error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signIn(email: String, password: String) async throws -> Bool {
        
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            print("Sign-in successful, UID: \(authResult.user.uid)")
            
            sessionComponent.saveSessionUseCase(userId: authResult.user.uid)
            
            return true
        } catch {
            print("Sign-in error: \(error.localizedDescription)")
            throw error
        }
        
    }
    
    func forgotPasword(email: String) async throws -> Bool {
        return true //TODO
    }
    
    func createOrUpdateUser(user: UserEntity) async throws -> Bool {
        let db = Firestore.firestore()
        
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
            "profile_picture": user.profilePic ?? ""
            
        ]
        
        do {
            try await db.collection("users").document(user.uid).setData(userData)
            print("Dokumen berhasil ditambahkan/diperbarui")
            return true
        } catch {
            print("Error menambahkan/memperbarui dokumen: \(error)")
            return false
        }
        
        
    }
    
    func uploadImage(image: Data) async -> String? {
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
