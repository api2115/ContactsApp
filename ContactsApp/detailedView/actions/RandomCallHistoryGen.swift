//
//  RandomCallHistoryGen.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 17/05/2023.
//

import Foundation

func randomCallHistoryGen() -> [[String]] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, HH:mm"
    
    let possibleStatusesForMissedCall = ["Didn’t connect", "Rang 5 times", "Voicemail"]
    let possibleStatusesForPickedCall = ["Connected", "Outgoing 15 min 12 sec"]
    
    var callHistory: [[String]] = []
    
    let entryCount = Int.random(in: 2...10)
    
    for _ in 1...entryCount {
        let date = generateRandomDate()
        let phoneNumber = generateRandomPhoneNumber()
        let callType = Bool.random() ? "picked" : "missed"
        
        let icon: String
        let status: String
        if callType == "missed" {
            status = possibleStatusesForMissedCall.randomElement() ?? ""
            icon = Bool.random() ? "arrow.up.right" : "arrow.down.right"
        } else {
            status = possibleStatusesForPickedCall.randomElement() ?? ""
            icon = "arrow.up.right"
        }
        
        callHistory.append([date, phoneNumber, icon, status, callType])
    }
    return callHistory
}

func generateRandomDate() -> String {
    let startDate = Date(timeIntervalSince1970: 0)
    let endDate = Date()
    let randomTimeInterval = TimeInterval.random(in: startDate.timeIntervalSince1970...endDate.timeIntervalSince1970)
    let randomDate = Date(timeIntervalSince1970: randomTimeInterval)
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "MMM dd, HH:mm"
    let dateString = dateFormatter.string(from: randomDate)
    
    return dateString
}

func generateRandomPhoneNumber() -> String {
    let countryCode = "+998"
    let phoneNumber = String(format: "%07d", Int.random(in: 0...9999999))
    return countryCode + phoneNumber
}
