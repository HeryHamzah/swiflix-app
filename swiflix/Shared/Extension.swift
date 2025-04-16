//
//  Extension.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 10/07/23.
//

import Foundation
import SwiftUI


extension String {
    
    //translate string
    func tr() -> String {
        return NSLocalizedString(self, comment: "");
    }
    
    func toyyyyMMddDate() -> Date? {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd"
          return dateFormatter.date(from: self)
      }
}


extension View {
    
/// CommonAppBar
public func appBar(title: String, backButtonAction: @escaping() -> Void) -> some View {
    
    self
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            backButtonAction()
        }) {
            Image(systemName:"chevron.backward") // set backbutton image here
                .renderingMode(.template)
        })
    
    }
}

extension Date {
    func getYear() -> Int {
           return Calendar.current.component(.year, from: self)
       }
    
    func getDay() -> Int {
        return Calendar.current.component(.day, from: self)
       }
    
    func dayName() -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = "EEEE" // Format untuk nama hari
           formatter.locale = Locale.current // Menggunakan pengaturan bahasa perangkat
           return formatter.string(from: self)
       }
    
    func getNextFiveDays() -> [Date] {
           let calendar = Calendar.current
           var dates: [Date] = []
           
           for i in 0..<5 {
               if let nextDay = calendar.date(byAdding: .day, value: i, to: self) {
                   dates.append(nextDay)
               }
           }
           return dates
       }
    
    func todMMMyyInString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yy" // "5 Feb 25"
        formatter.locale = Locale(identifier: "id_ID") // Gunakan "id_ID" agar bulan sesuai dengan format Indonesia
        return formatter.string(from: self)
    }
    
    var millisecondsSinceEpoch: Int {
          return Int(self.timeIntervalSince1970 * 1000)
      }
}

extension Calendar {
    func isTimeEnabled(time: TimeEntity, for selectedDate: Date) -> Bool {
        let now = Date()

        let nowHour = self.component(.hour, from: now)
        let nowMinute = self.component(.minute, from: now)

        if self.isDateInToday(selectedDate) {
            
            if time.hour < nowHour || (time.hour == nowHour && time.minute < nowMinute) {
                return false
            }
        }

        return true
    }
}

extension MovieDetailEntity {
    func formattedDetails() -> String {
        let year = releaseDate != nil ? "\(releaseDate!.getYear().description)" : nil
        let genreNames = genres.map { $0.name }.joined(separator: ", ")
        let durationString = "\(duration / 60) jam \(duration % 60) menit"
        
        if let year = year {
            return "\(year) | \(genreNames) | \(durationString)"
        } else {
            return "\(genreNames) | \(durationString)"
        }
    }
}

extension Int {
    func toRupiah() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID") // Locale Indonesia
        formatter.maximumFractionDigits = 0 // Tidak ada desimal
        return formatter.string(from: NSNumber(value: self)) ?? "-"
    }
    
    func toRupiahWithoutSymbol() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID") // Locale Indonesia
        formatter.maximumFractionDigits = 0 // Tidak ada desimal
        formatter.currencySymbol = ""
        return formatter.string(from: NSNumber(value: self)) ?? "-"
    }
}
