//
//  NavigationManager.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 15/01/25.
//

import SwiftUI

@Observable class NavigationManager {
    var navigationPath: NavigationPath
    var homeTab: Int = 1
    
    init(navigationPath: NavigationPath) {
        self.navigationPath = navigationPath
    }
    
    func removeLast() {
        navigationPath.removeLast()
    }
    
    func navigateTo(to route: Route) {
        navigationPath.append(route)
    }
    
    func navigateToAndRemoveAll(to route: Route) {
        navigationPath.removeLast(navigationPath.count)
        
        navigateTo(to: route)
    }
    
    func logout(to route: Route) {
        navigationPath.removeLast(navigationPath.count)
        homeTab = 1
        
        navigateTo(to: route)
    }
    
    func toHome(tab: Int = 1) {
        navigationPath.removeLast(navigationPath.count)
        homeTab = tab
    }
    
    func navigateToMyWallet() {
        toHome(tab: 3)
        navigationPath.append(Route.myWallet)
    }
    
}
