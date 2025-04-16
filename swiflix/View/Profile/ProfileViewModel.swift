import Foundation

@MainActor
@Observable
class ProfileViewModel {
    var profileComponent: ProfileComponent
    
    init(profileComponent: ProfileComponent) {
        self.profileComponent = profileComponent
    }
    
    var profile: UserEntity?
    var isLoadingGetProfile = false
    var isErrorGetProfile = false
    
    var isLoadingEditProfile = false
    var isErrorEditProfile = false
    
    func getProfile(uid: String) async {
        isLoadingGetProfile = true
        isErrorGetProfile = false
        
        do {
            let data = try await profileComponent.getProfileUseCase(uid: uid)
            
            if let newProfile = data {
                profile = newProfile
            } else {
                isErrorGetProfile = true
            }
            isLoadingGetProfile = false
            
        } catch {
            isLoadingGetProfile = false
            isErrorGetProfile = true
            
        }
    }
    
    func editProfile(profile: UserEntity, photo: Data? = nil) async {
        isLoadingEditProfile = true
        isErrorEditProfile = false
        
        do {
            let user = try await profileComponent.editProfileUseCase(user: profile, photo: photo)
            
            if let newProfile = user {
                self.profile = newProfile
            } else {
                isErrorEditProfile = true
            }
            isLoadingEditProfile = false
            
        } catch {
            isLoadingEditProfile = false
            isErrorEditProfile = true
        }
    }
}
