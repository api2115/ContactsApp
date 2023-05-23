//
//  AdderViewModel.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 22/05/2023.
//

import Foundation

class AdderViewModel {
    
    //MARK: - Variables
    var oldContact: Contact?
    
    //MARK: - Initializer
    init(oldContact: Contact?) {
        self.oldContact = oldContact
    }
    
    //MARK: - Methods
    func addContact(name: String, surname: String, number: String) -> Contact {
        return ContactsManager.shared.createItem(name: name, surname: surname, number: number)
    }
    
    func editContact(name: String, surname: String, number: String) -> Contact {
        self.oldContact = ContactsManager.shared.updateItem(item: oldContact!, newName: name, newSurname: surname, newNumber: number)
        return oldContact!
    }
    
    
}
