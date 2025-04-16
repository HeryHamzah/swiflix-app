//
//  WrapperScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/03/25.
//

import SwiftUI

struct RootScreen: View {
    
    @Environment(NavigationManager.self) var navigationManager
    @Environment(SessionViewModel.self) var sessionViewModel
    @Environment(ProfileViewModel.self) var profileViewModel
    
    @State var root: Route = Route.splash
    @State private var hasLoaded = false
    
    
    var body: some View {
        @Bindable var nav = navigationManager
        
        NavigationStack(path: $nav.navigationPath) {
            
            root.destination
                .task {
                    guard !hasLoaded else { return }
                    hasLoaded = true
                    
                    try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 detik
                    
                    await checkAndSetRoot()
                }
                .navigationDestination(for: Route.self) { route in
                    route.destination
                }
        }
        
    }
    
    @MainActor
    private func checkAndSetRoot() async {
        
        sessionViewModel.checkSession()
        
        guard let uid = sessionViewModel.uid else {
            root = .onboarding
            return
        }
        
        if sessionViewModel.isLoggedIn {
            await profileViewModel.getProfile(uid: uid)
            
            root = (profileViewModel.profile != nil) ? .home : .onboarding
            
        } else {
            root = .onboarding
        }
    }
}


