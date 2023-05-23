//
//  FiirstViewModel.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 22/05/2023.
//

import Foundation

class FirstViewModel {
    
    // MARK: - Variables
    var onContactsUpdated: (()->Void)?
    
    private(set) var Contacts : [Contact] = [] {
        didSet {
            self.onContactsUpdated?()
        }
    }
    
    // MARK: - Initializer
    init() {
        self.fetchContacts()
    }
    
    // MARK: - Methods
    public func fetchContacts() {
        self.Contacts = ContactsManager.shared.getAllItems()
    }
    
    public func setContacts(_ newContacts: [Contact]) {
        self.Contacts = newContacts
    }
    
    public func deleteAllContacts() {
        self.Contacts = ContactsManager.shared.deleteAllItems()
    }
    
    
}


