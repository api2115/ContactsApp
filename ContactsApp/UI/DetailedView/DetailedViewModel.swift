//
//  DetailedViewModel.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 22/05/2023.
//

import Foundation

class DetailedViewModel {
    
    //MARK: - Variables
    let contact: Contact
    
    //MARK: - Initializer
    init(_ contact: Contact) {
        self.contact = contact
    }
    
    //MARK: - Methods
    public func deleteContact() {
        ContactsManager.shared.deleteItem(item: self.contact)
    }
    
    // MARK: - Computed Properties
    var getCallHistory: Array<CallHistory> {
        let callHistorySet = self.contact.callHistory as? Set<CallHistory> ?? []
        let callHistoryArray = Array(callHistorySet)
        
        let callHistory = callHistoryArray.sorted { (element1, element2) -> Bool in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, HH:mm"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            if let date1 = formatter.date(from: element1.date ?? ""),
               let date2 = formatter.date(from: element2.date ?? "") {
                return date1 < date2
            }
            return false
        }
        
        return callHistory
    }
    
}
