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
    
}
