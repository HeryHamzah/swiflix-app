import Foundation

final class DI {
    
    static let shared = DI() // Singleton instance for DI
    
    private init() {}
    
    // MARK: - Singleton Dependencies
    lazy var sessionComponent: SessionComponent = {
        SessionComponent(sessionRepository: SessionRepositoryImpl(localSessionDataSource: LocalSessionDataSource()))
    }()
    
    lazy var authenticationRepository: AuthenticationRepository = {
        AuthenticationRepositoryImpl(authenticationDataSource: FirebaseAuthenticationDataSourceImpl(sessionComponent: sessionComponent))
    }()
    
    lazy var movieRepository: MovieRepository = {
        MovieRepositoryImpl(movieDataSource: RemoteMovieDataSource())
    }()
    
    lazy var profileRepository: ProfileRepository = {
        ProfileRepositoryImpl(remoteProfileDataSource: RemoteProfileDataSource())
    }()
    
    // MARK: - ViewModel Factories
    @MainActor func makeAuthenticationViewModel() -> AuthenticationViewModel {
        AuthenticationViewModel(authComponent: AuthenticationComponent(authRepository: authenticationRepository))
    }
    
    func makeSessionViewModel() -> SessionViewModel {
        SessionViewModel(sessionComponent: sessionComponent)
    }
    
    func makeUploadImageViewModel() -> UploadImageViewModel {
        UploadImageViewModel(uploadImageUseCase: UploadImageUseCase(authenticationRepository: authenticationRepository))
    }
    
    @MainActor func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(profileComponent: ProfileComponent(profileRepository: profileRepository))
    }
    
    @MainActor func makeMovieViewModel() -> MovieViewModel {
        MovieViewModel(movieComponent: MovieComponent(movieRepository: movieRepository))
    }
    
    @MainActor func makeMovieDetailViewModel() -> MovieDetailViewModel {
        MovieDetailViewModel(movieComponent: MovieComponent(movieRepository: movieRepository))
    }
    
    func makeReservationViewModel() -> ReservationViewModel {
        ReservationViewModel(reservationUseCase: ReservationUseCase(repository: ReservationRepositoryImpl(
            remoteTransactionDataSource: RemoteTransactionDataSource(),
            remoteTicketDataSource: RemoteTicketDataSource(sessionDataSource: LocalSessionDataSource()),
            remoteProfileDataSource: RemoteProfileDataSource(),
            localSessionDataSource: LocalSessionDataSource()
        )))
    }
    
    func makeTopUpWalletViewModel() -> TopUpWalletViewModel {
        TopUpWalletViewModel(topUpWalletUseCase: TopUpWalletUseCase(walletRepository: WalletRepositoryImpl(remoteProfileDataSource: RemoteProfileDataSource(), localSessionDataSource: LocalSessionDataSource(), transactionDataSource: RemoteTransactionDataSource())))
    }
    
    @MainActor func makeTicketListViewModel() -> TicketListViewModel {
        TicketListViewModel(
            getNewestTicketsUseCase: GetNewestTicketsUseCase(ticketRepository: TicketRepositoryImpl(
                ticketDataSource: RemoteTicketDataSource(sessionDataSource: LocalSessionDataSource())
            )), getExpiredTicketsUseCase: GetExpiredTicketsUseCase(ticketRepository: TicketRepositoryImpl(
                ticketDataSource: RemoteTicketDataSource(sessionDataSource: LocalSessionDataSource())
            ))
        )
    }
    
    func makeMyWalletViewModel() -> MyWalletViewModel {
        MyWalletViewModel(getTransactionsUseCase: GetTransactionsUseCase(transactionRepository: TransactionRepositoryImpl(transactionDataSource: RemoteTransactionDataSource(), sessionDataSource: LocalSessionDataSource())))
    }
    
}
