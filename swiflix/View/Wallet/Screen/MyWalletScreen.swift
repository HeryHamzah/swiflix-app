//
//  MyWalletScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 01/02/25.
//

import SwiftUI

struct MyWalletScreen: View {
    
    @Environment(MyWalletViewModel.self) var myWalletViewModel
    @Environment(ProfileViewModel.self) var profileViewModel
    @Environment(NavigationManager.self) var navigationManager
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading) {
                
                if profileViewModel.isLoadingGetProfile {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: .infinity, height: 185)
                        .shimmeringGray()
                    
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.animation))
                        .frame(width: .infinity, height: 185)
                        .shadow(radius: 5)
                        .overlay {
                            
                            VStack(alignment: .leading) {
                                
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading) {
                                        Text("your_balance")
                                            .fontWeight(.light)
                                        
                                        Spacer()
                                            .frame(height: 12)
                                        
                                        Text(profileViewModel.profile?.balance.toRupiah() ?? "-")
                                            .font(.title2)
                                            .bold()
                                    }
                                    
                                    Spacer()
                                    
                                    ZStack{
                                        Circle()
                                            .fill(Color(.systemRed))
                                            .frame(width: 30, height: 30)
                                            .offset(x: -9)
                                        
                                        
                                        Circle()
                                            .fill(Color(.systemOrange).opacity(0.8))
                                            .frame(width: 30, height: 30)
                                            .offset(x: 9)
                                        
                                    }
                                    .frame(width: 50, height: 30)
                                }
                                
                                Spacer()
                                
                                HStack() {
                                    
                                    VStack(alignment: .leading) {
                                        Text("card_holder")
                                            .fontWeight(.light)
                                        
                                        Text(profileViewModel.profile?.name ?? "-")
                                            .font(.title3)
                                            .lineLimit(1)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        Text("card_id")
                                            .fontWeight(.light)
                                        
                                        Text("SWIFLIX")
                                            .font(.title3)
                                    }
                                }
                            }
                            .padding()
                        }
                }
                
                
                
                Spacer().frame(height: 20)
                
                Text("recent_transactions")
                
                Spacer().frame(height: 12)
                
                if myWalletViewModel.isLoadingGetTransactions {
                    ScrollView() {
                        LazyVStack(spacing: 12) {
                            ForEach(0...10, id: \.self) { _ in
                                TransactionShimmerLoadingView()
                            }
                        }
                    }
                    .scrollDisabled(true)
                }
                else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(myWalletViewModel.transactions, id: \.self) { transaction in
                                TransactionView(transaction: transaction)
                            }
                        }
                        
                    }
                }
                
                Spacer()
                
            }
            .padding(.horizontal, 20)
            
            if !myWalletViewModel.isLoadingGetTransactions {
                Button {
                    navigationManager.navigateTo(to: .topUpWallet)
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(Color(.animation))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4, x: 0, y: 4)
                    
                }
                .padding()
            }
        }
        .task {
                await myWalletViewModel.getTransactions()
        }
        
    }
}

#Preview {
    MyWalletScreen()
        .environment(DI.shared.makeMyWalletViewModel())
        .environment(DI.shared.makeProfileViewModel())
}
