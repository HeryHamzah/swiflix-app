//
//  ResetPasswordScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/08/23.
//

import SwiftUI

struct ResetPasswordScreen: View {
    
    @State private var email: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("reset_password".tr()).font(.title2)
            Spacer().frame(height: 20)
            Text("reset_password_desc").font(.callout)
            
            Spacer().frame(height: 40)
            
            Group{
                EmailTextFieldView(email: $email).padding(.bottom, 30)
            }
            .submitScope()
            
            Spacer().frame(height: 20)
            
            
            ButtonView(
                action: {
                    print("tapped")
                },
                text: "sign_in".tr()
            )
            
            Spacer()
        }.padding()
    }
}

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
    }
}
