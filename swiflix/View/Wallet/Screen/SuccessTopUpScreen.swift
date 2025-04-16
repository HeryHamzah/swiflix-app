//
//  TopUpSuccessScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 01/02/25.
//

import SwiftUI

struct SuccessTopUpScreen: View {
    
    @Environment(NavigationManager.self) var navigationManager
    
    var body: some View {
        VStack {
            Image("top_up_success_image")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 150, maxHeight: 150)
            
            
            Spacer().frame(height: 70)
            
            Text("Emmm Yummy!")
                .font(.title3)
            
            Spacer().frame(height: 16)
            
            Text("top_up_success_desc")
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 70)
            
            ButtonView(action: {
                navigationManager.navigateToMyWallet()
            }, text: "my_wallet".tr())
            
            Spacer().frame(height: 20)
            
            HStack{
                Text("discover_new_movie")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                Spacer().frame(width: 5)
                Text("back_to_home")
                    .font(.callout)
                    .foregroundStyle(Color(.primary))
                    .onTapGesture {
                        navigationManager.toHome()
                    }
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    SuccessTopUpScreen()
        .environment(NavigationManager(navigationPath: NavigationPath()))
}
