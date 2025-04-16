//
//  EditProfileScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 18/06/24.
//

import SwiftUI

struct EditProfileScreen: View {
    
    @Environment(ProfileViewModel.self) private var profileViewModel
    @Environment(NavigationManager.self) private var navigationManager
    @State var fullname: String = ""
    @State var email: String = ""
    @State var photo: Data?
    
    var body: some View {
        
        
        ZStack {
            VStack{
                
                ProfilePicView(apiImagePath: profileViewModel.profile?.profilePic) {
                    imageData in
                    if let image = imageData {
                        photo = image
                    }
                }
                
                Spacer().frame(height: 30)
                
                EmailTextFieldView(email: $email)
                    .disabled(true)
                
                Spacer().frame(height: 30)
                
                FullNameTextFieldView(fullName: $fullname)
                
                Spacer().frame(height: 30)

                ButtonView(action: {
                    Task {
                        await profileViewModel.editProfile(profile: profileViewModel.profile!.copyWith(name: fullname), photo: photo)
                        
                        if profileViewModel.isErrorEditProfile {
                            //TODO
                        } else {
                            navigationManager.removeLast()
                        }
                    }
                    
                }, text: "Update")
                
                Spacer()
            }
            .padding()
            
            if profileViewModel.isLoadingEditProfile {
                FullScreenLoadingView()
            }
        }
        .onAppear {
            fullname = profileViewModel.profile?.name ?? ""
            email = profileViewModel.profile?.email ?? ""
        }
    }
}

#Preview {
    EditProfileScreen()
        .environment(DI.shared.makeProfileViewModel())
}
