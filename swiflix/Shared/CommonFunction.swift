//
//  CommonFunction.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 16/07/23.
//

import Foundation

//Email validator
func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

//Get Email Validator Message
func emailValidator(_ email: String) -> String? {
    if email.isEmpty{
        return "empty_email"
    }else if(!isValidEmail(email)){
        return "wrong_format_email"
    }else{
        return nil
    }
}

func passwordValidator(password: String) -> String? {
    if password.isEmpty{
        return "empty_password"
    } else if password.count < 6 {
        return "password_must_be_at_least_6_characters"
    }
    
    return nil
}

func confirmPasswordValidator(password: String, checkForConfirmPassword: String? = nil) -> String? {
    if password.isEmpty {
        return "empty_confirm_password"
    } else if password != checkForConfirmPassword {
        return "password_confirmation_does_not_match"
    }
    
    return nil
}

func formatCurrency(_ value: String) -> String {
    // Hapus semua karakter non-digit
    let digits = value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    
    let maxDigits = 12 // Misalnya, batas maksimal 15 digit
    let trimmedDigits = String(digits.prefix(maxDigits))
    
    // Format angka ke dalam format mata uang
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "id_ID") // Set locale ke Indonesia
    formatter.currencySymbol = "Rp"
    formatter.maximumFractionDigits = 0 // Tidak perlu desimal untuk IDR
    
    if let number = Int(trimmedDigits), let formattedString = formatter.string(from: NSNumber(value: number)) {
        return formattedString
    }
    
    return ""
}

// Fungsi untuk mengonversi string yang diformat kembali ke Int
   func convertFormattedCurrencyToInt(_ formattedString: String) -> Int? {
      // Hapus simbol mata uang (Rp) dan pemisah ribuan (.)
      let cleanedString = formattedString
          .replacingOccurrences(of: "Rp", with: "")
          .replacingOccurrences(of: ".", with: "")
      
      // Konversi ke Int
      return Int(cleanedString)
  }

// Fungsi untuk mengonversi string "HH:mm" ke TimeEntity
func convertStringToTimeEntity(_ timeString: String) throws -> TimeEntity {
    // Pisahkan string berdasarkan delimiter ":"
    let components = timeString.components(separatedBy: ":")
    
    // Pastikan ada 2 komponen (hour dan minute)
    guard components.count == 2,
          let hour = Int(components[0]),
          let minute = Int(components[1]) else {
        throw NSError(domain: "Gagal convert string to timeentity karna format tidak sesuai", code: 99)
    }
    
    // Pastikan nilai hour dan minute valid
    guard (0..<24).contains(hour), (0..<60).contains(minute) else {
        throw NSError(domain: "Jam harus lebih kecil dari 24 dam menit harus lebih kecil dari 60", code: 98)
    }
    
    // Buat dan kembalikan TimeEntity
    return TimeEntity(hour: hour, minute: minute)
}
