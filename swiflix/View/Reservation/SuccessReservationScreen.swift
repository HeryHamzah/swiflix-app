//
//  SuccessReservationScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 22/01/25.
//

import SwiftUI

struct SuccessReservationScreen: View {
    @Environment(NavigationManager.self) var navigationManager
    var body: some View {
        VStack {
            Image("booking_success_image")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 150, maxHeight: 150)
            
            Spacer().frame(height: 70)
            
            Text("happy_watching")
                .font(.title3)
            
            Spacer().frame(height: 16)
            
            Text("booking_success_desc")
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 70)
            
            ButtonView(action: {
                navigationManager.toHome(tab: 2)
            }, text: "my_ticket".tr())
            
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
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SuccessReservationScreen()
        .environment(NavigationManager(navigationPath: NavigationPath()))
    
}
