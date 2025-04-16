import Foundation
import SwiftUI

struct OnBoardingScreen: View {
    
    @Environment(NavigationManager.self) var navigationManager
    @Environment(RegisterViewModel.self) private var registerViewModel
    
    var body: some View{
        
            GeometryReader {
                geo in
                VStack{
                    Spacer()
                    Image("onboarding_image").resizable().aspectRatio(contentMode: .fit).padding()
                    
                    Image("logo")
                    
                    Text("on_boarding_desc").multilineTextAlignment(.center).font(.title3)
                    
                    Spacer().frame(height: 50)
                    
                    ButtonView(action: {
                        navigationManager.navigateTo(to: .register)
                    }, text: "get_started".tr())
                    
                    
                    HStack{
                        Text("question_have_account")
                        Text("sign_in")
                            .foregroundColor(Color(.primary))
                            .onTapGesture {
                                navigationManager.navigateTo(to: .signIn)
                            }
                    }
                    
                    Spacer()
                    
                }.padding()
                
            }
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
            .onAppear {
                registerViewModel.clear()
            }
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
