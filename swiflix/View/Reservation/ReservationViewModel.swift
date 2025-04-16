//
//  ReservationViewModel.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 16/01/25.
//

import Foundation

@Observable class ReservationViewModel {
    let reservationUseCase: ReservationUseCase
    
    var selectedDate: Date
    var selectedTime: TimeEntity? = nil
    var dates: [Date]
    var theaters: [TheaterEntity]
    var selectedTheater: TheaterEntity?
    var selectedSeats: [String] = []
    var movieDetail : MovieDetailEntity?
    var reservationId: String = UUID().uuidString
    var isSuccessReservation: Bool?
    var isLoadingReservation: Bool = false
    
    let reservationFee: Int = 500
    
    var totalPayment: Int? {
        guard let selectedTheater = selectedTheater else {
            return nil
        }
        
        return (selectedSeats.count * selectedTheater.ticketPrice) + (selectedSeats.count * reservationFee)
    }
    
    var seatsInString: String {
        selectedSeats.joined(separator: ", ")
    }
    
    var dateAndTime: String  {
        guard let time = selectedTime else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E d"
            
        let formattedDate = dateFormatter.string(from: selectedDate)
        
        return "\(formattedDate), \(time.asString)"
    }
    
    init(reservationUseCase: ReservationUseCase) {
        self.reservationUseCase = reservationUseCase
        
        let nextFiveDays = Date().getNextFiveDays()
        let times = [
            TimeEntity(hour: 12, minute: 00),
            TimeEntity(hour: 14, minute: 15),
            TimeEntity(hour: 16, minute: 30),
            TimeEntity(hour: 18, minute: 45),
            TimeEntity(hour: 21, minute: 00),
        ]
        
        theaters = [
            TheaterEntity(name: "Daya Grand Square CGV", schedules: times, ticketPrice: 40000),
            TheaterEntity(name: "Phinisi Point Cinepolis", schedules: times, ticketPrice: 60000),
            TheaterEntity(name: "Panakkukang XXI", schedules: times, ticketPrice: 45000),
        ]
        
        dates = nextFiveDays
        selectedDate = nextFiveDays.first!
                
    }
    
    func setNewData(movieDetail: MovieDetailEntity) {
        _reset()
        self.movieDetail = movieDetail
        reservationId = UUID().uuidString
    }
    
    func changeSelectedDate(to date: Date) {
        if(selectedDate != date) {
            selectedTime = nil
            selectedTheater = nil
        }
        selectedDate = date
    }
    
    func changeSelectedTheater(theater: TheaterEntity, time: TimeEntity) {
        selectedTheater = theater
        selectedTime = time
    }
    
    func changeSelectedSeats(seat: String) {
        if selectedSeats.contains(seat) {
            selectedSeats.removeAll { $0 == seat }
        } else {
            selectedSeats.append(seat)
        }
    }
    
    func reservation() async {
        isLoadingReservation = true
        isSuccessReservation = nil
        
        guard let theater = selectedTheater, let time = selectedTime, let totalPayment = totalPayment, let movieDetail = movieDetail else {
            isLoadingReservation = false
            isSuccessReservation = false
            return
        }
        
        let isSuccess = await reservationUseCase(reservation: ReservationEntity(id: reservationId, theater: theater, date: selectedDate, time: time, seats: selectedSeats), totalPrice: totalPayment, movieDetail: movieDetail)
        
            self.isSuccessReservation = isSuccess
            self.isLoadingReservation = false
     }
    
    func _reset() {
        selectedTime = nil
        selectedTheater = nil
        selectedSeats.removeAll()
        selectedDate = dates.first!
        movieDetail = nil
    }
    
}
