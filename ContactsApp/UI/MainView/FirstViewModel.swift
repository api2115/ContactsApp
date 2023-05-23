//
//  FiirstViewModel.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 22/05/2023.
//

import Foundation

class MainViewModel {
    
    // MARK: - Output
    
    struct Output {
        let onContactsUpdated: (()->Void)?
    }
    
    var output: Output?
    private(set) var Contacts : [Contact] = [] {
        didSet {
            output?.onContactsUpdated?()
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
    
    public func sort(asc: Bool) {
        asc ? self.Contacts.sort {($0.name ?? "").lowercased() < ($1.name ?? "").lowercased()} :
        self.Contacts.sort {($0.name ?? "").lowercased() > ($1.name ?? "").lowercased()}
    }
    
    public func search(text: String) {
        self.fetchContacts()
        self.Contacts = self.Contacts.filter { person in
            return (person.name ?? "") .lowercased().contains(text.lowercased()) ||
                   (person.surname ?? "") .lowercased().contains(text.lowercased())
        }
        
    }
    
    
}


