//
//  RandomCallHistoryGen.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 17/05/2023.
//

import Foundation
import UIKit

func randomCallHistoryGen(_ contact: Contact) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, HH:mm"
    
    let possibleStatusesForMissedCall = ["Didn’t connect", "Rang 5 times", "Voicemail"]
    let possibleStatusesForPickedCall = ["Connected", "Outgoing 15 min 12 sec"]
    
    let entryCount = Int.random(in: 2...10)
    
    for _ in 1...entryCount {
        let date = generateRandomDate()
        let phoneNumber = generateRandomPhoneNumber()
        let callType = Bool.random() ? "picked" : "missed"
        
        let icon: String
        let status: String
        if callType == "missed" {
            status = possibleStatusesForMissedCall.randomElement() ?? ""
            icon = Bool.random() ? "CallUpArrowIcon" : "CallDownArrowIcon"
        } else {
            status = possibleStatusesForPickedCall.randomElement() ?? ""
            icon = "CallUpArrowIcon"
        }
        let call = CallHistory(context: context)
        call.date = date
        call.phoneNumber = phoneNumber
        call.icon = icon
        call.status = status
        call.callType = callType
        call.contact = contact
    }
    do {
        try context.save()
    }
    catch {
        print(error)
    }

}

private func generateRandomDate() -> String {
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

private func generateRandomPhoneNumber() -> String {
    let countryCode = "+998"
    var phoneNumber = String(format: "%02d", Int.random(in: 0...99))
    phoneNumber += " \(String(format: "%03d", Int.random(in: 0...999)))"
    phoneNumber += " \(String(format: "%02d", Int.random(in: 0...99)))"
    phoneNumber += " \(String(format: "%02d", Int.random(in: 0...99)))"
    return countryCode + phoneNumber
}
