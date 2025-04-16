//
//  RouteEnum.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 20/01/25.
//

enum Route: Hashable {
    case movieDetail(movieId: Int),
         reservation(movieDetail: MovieDetailEntity),
         chooseSeat,
         checkout,
         successReservation,
         topUpWallet,
         successTopUpWallet,
         myWallet,
         ticketDetail(ticket: TicketEntity),
         register,
         chooseFavorite,
         signIn,
         resetPassword,
         accountConfirmation,
         editProfile,
         home,
         onboarding,
         splash
}
