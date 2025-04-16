//
//  RouteExt.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 26/01/25.
//
import SwiftUI

extension Route {
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .movieDetail(movieId: let movieId):
            MovieDetailScreen(movieId: movieId)
            
        case .reservation(movieDetail: let movieDetail):
            ReservationScreen(movieDetail: movieDetail)
            
        case .chooseSeat:
            ChooseSeatScreen()
            
        case .checkout:
            CheckoutScreen()
            
        case .successReservation:
            SuccessReservationScreen()
            
        case .topUpWallet:
            TopUpWalletScreen()
            
        case .successTopUpWallet:
            SuccessTopUpScreen()
            
        case .myWallet:
            MyWalletScreen()
                .environment(DI.shared.makeMyWalletViewModel())
            
        case .ticketDetail(ticket: let ticket):
            TicketDetailScreen(ticket: ticket)
            
        case .register:
            RegisterScreen()
            
        case .chooseFavorite:
            ChooseFavoriteScreen()
            
        case .signIn:
            SignInScreen()
            
        case .resetPassword:
            ResetPasswordScreen()
            
        case .accountConfirmation:
            AccountConfirmationScreen()
            
        case .editProfile:
            EditProfileScreen()
            
        case .home:
            HomeScreen()
            
        case .onboarding:
            OnBoardingScreen()
            
        case .splash:
            SplashScreen()
        }
    }
}
