//
//  swiflixApp.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 09/07/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct swiflixApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var navigationManager = NavigationManager(navigationPath: NavigationPath())
    @State var registerViewModel = RegisterViewModel()
        
    var body: some Scene {
        WindowGroup {
            RootScreen()
                .environment(navigationManager)
                .environment(DI.shared.makeSessionViewModel())
                .environment(DI.shared.makeAuthenticationViewModel())
                .environment(registerViewModel)
                .environment(DI.shared.makeProfileViewModel())
                .environment(DI.shared.makeMovieViewModel())
                .environment(DI.shared.makeReservationViewModel())
        }
        
    }
}
