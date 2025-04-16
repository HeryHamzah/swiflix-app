//
//  TopUpView.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 23/01/25.
//

import SwiftUI

struct TopUpWalletScreen: View {
    @State private var topUpWalletViewModel = DI.shared.makeTopUpWalletViewModel()
    @Environment(ProfileViewModel.self) var profileViewModel
    @Environment(NavigationManager.self) var navigationManager
    
    let templates = [50_000, 100_000, 150_000, 200_000, 250_000, 500_000, 1_000_000, 2_500_000, 5_000_000]
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    @State private var isShowingSheet = false
    
    var body: some View {
        
        ZStack {
            VStack(alignment:.leading) {
                Spacer().frame(height: 20)
                
                TextField("Rp0", text: $topUpWalletViewModel.amount)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray3), lineWidth: 1)
                    )
                    .onChange(of: topUpWalletViewModel.amount) { oldValue, newValue in
                        topUpWalletViewModel.changeAmount(newValue)
                    }
                
                Spacer().frame(height: 40)
                
                Text("choose_by_template")
                
                Spacer().frame(height: 20)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(templates, id: \.self) { value in
                        TopUpTemplateView(value: value, isSelected: value == topUpWalletViewModel.amountInt)
                            .onTapGesture {
                                withAnimation {
                                    topUpWalletViewModel.changeAmount(value.description)
                                }
                            }
                    }
                }
                
                Spacer()
                
                ButtonView(
                    action: {
                        Task {
                            await topUpWalletViewModel.topUpWallet()
                            
                            if topUpWalletViewModel.isSuccessTopUp == true {
                                Task {
                                   await profileViewModel.getProfile(uid: profileViewModel.profile!.uid)
                                }
                                navigationManager.removeLast()
                                navigationManager.navigateTo(to: .successTopUpWallet)
                                
                            }
                            
                        }
                    },
                    text: "top_up_now".tr(),
                    backgroundColor: Color(.animation),
                    isDisabled: !topUpWalletViewModel.isAmountValid
                )
                
                
                Spacer()
                
            }
            .padding(.horizontal, 20)
            
            if topUpWalletViewModel.isLoadingTopUp {
                FullScreenLoadingView()
            }
        }
        .navigationTitle("top_up")
        .alert("top_up_failed", isPresented: $topUpWalletViewModel.showAlert) {
            Button("ok", role: .cancel) {}
        } message: {
            Text("top_up_failed_desc")
        }
        
    }
}

#Preview {
    NavigationStack{
        TopUpWalletScreen()
            .navigationBarTitleDisplayMode(.inline)
            .environment(NavigationManager(navigationPath: NavigationPath()))
    }
    
}
