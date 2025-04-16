//
//  HomeScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/08/23.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(MovieViewModel.self) var movieViewModel
    @Environment(SessionViewModel.self) var sessionViewModel
    @Environment(ProfileViewModel.self) var profileViewModel
    
    @Environment(NavigationManager.self) var navigationManager
    
    var body: some View {
        @Bindable var nav = navigationManager
        
        TabView(selection: $nav.homeTab) {
            MovieScreen()
                .tabItem {
                    Label("movie", systemImage: "movieclapper.fill")
                }
                .tag(1)
            
            TicketScreen()
                .tabItem {
                    Label("my_ticket", systemImage: "ticket.fill")
                }
                .tag(2)
            
            
            ProfileScreen()
                .tabItem {
                    Label("profile", systemImage: "person.fill")
                }
                .tag(3)
        }
        .navigationBarBackButtonHidden(true)
        .tint(Color(.primary))
        .task {
            sessionViewModel.checkSession()

            guard let uid = sessionViewModel.uid else {
                return
            }
            
            if profileViewModel.profile == nil {
                await profileViewModel.getProfile(uid: uid)
            }
            
        }
        
    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environment(DI.shared.makeMovieViewModel())
    }
}
