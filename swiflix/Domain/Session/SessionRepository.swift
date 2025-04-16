//
//  SessionRepository.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/09/23.
//

import Foundation

protocol SessionRepository {
    func saveSession(userId: String)
    func removeSession() -> Bool
    func checkSession() -> String?
 }
