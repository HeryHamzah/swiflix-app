//
//  ProfileScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/01/24.
//

import SwiftUI

struct ProfileScreen: View {
    
    @Environment(ProfileViewModel.self) var profileViewModel
    @Environment(NavigationManager.self) var navigationManager
    @Environment(SessionViewModel.self) var sessionViewModel
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    Image("profile-background")
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height / 3)
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal, -16)
                        .overlay {
                            
                            SwiflixRemoteImage(urlString: profileViewModel.profile?.profilePic ?? "") { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color(.darkGray)
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(.circle)
                            .offset(x: -(geo.size.width / 3), y:  geo.size.height / 6)
                        }
                    
                    Spacer().frame(height: 50)
                    Text(profileViewModel.profile?.name ?? "-" )
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text(profileViewModel.profile?.email ?? "-")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                    
                    Spacer().frame(height: 30)
                    
                    ListTile(imageSystemName: "person.circle", name: "edit_profile")
                        .onTapGesture {
                            navigationManager.navigateTo(to: .editProfile)
                        }
                    
                    Divider().padding(.vertical, 6)
                    
                    ListTile(imageSystemName: "wallet.pass", name: "my_wallet")
                        .onTapGesture {
                            navigationManager.navigateTo(to: .myWallet)
                        }
                    
                    Divider().padding(.vertical, 6)
                    
                    ListTile(imageSystemName: "movieclapper", name: "my_favorite_movies")
                        .onTapGesture {
                            
                        }
                    Divider().padding(.vertical, 6)
                    
                    ListTile(imageSystemName: "hand.thumbsup.circle", name: "rate_app")
                        .onTapGesture {
                            
                        }
                    Divider().padding(.vertical, 6)
                    
                    ListTile(imageSystemName: "info.circle", name: "about_us")
                        .onTapGesture {
                            
                        }
                    Divider().padding(.vertical, 6)
                    
                    ListTile(imageSystemName: "rectangle.portrait.and.arrow.forward", name: "logout")
                        .onTapGesture {
                            sessionViewModel.logout()
                            
                            if sessionViewModel.isLoggedOut {
                                navigationManager.logout(to: .onboarding)
                            }
                        }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                
            }
            .ignoresSafeArea(edges: .top)
        }
    }
    
    @ViewBuilder
    private func ListTile( imageSystemName: String, name: String) -> some View {
        
        HStack(spacing: 20) {
            Image(systemName: imageSystemName)
                .resizable()
                .frame(width: 25, height: 25)
            
            Text(name.tr())
                .font(.title3)
        }
        
    }
}

#Preview {
    
    ProfileScreen()
    
}
