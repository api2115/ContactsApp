//
//  AdderViewModel.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 22/05/2023.
//

import Foundation

class AddContactViewModel {
    
    // MARK: - Input

    struct Input {
        let onAddContact: ((String?, String?, String?)->Void)
        let onEditContact: ((String?, String?, String?)->Contact?)
    }
    
    //MARK: - Variables
    var oldContact: Contact?
    private(set) var input: Input?
    
    //MARK: - Initializer
    init(oldContact: Contact?) {
        self.oldContact = oldContact
        setUpInput()
    }
    
    //MARK: - Methods
    private func setUpInput() {
        input = .init(
            onAddContact: { [weak self] name, surname, number in
                self?.addContact(name: name, surname: surname, number: number)
            },
            onEditContact: { [weak self] name, surname, number in
                self?.editContact(name: name, surname: surname, number: number)
            }
        )
    }
    
    private func addContact(name: String?, surname: String?, number: String?) {
        let item = ContactsManager.shared.createItem(name: name, surname: surname, number: number)
        randomCallHistoryGen(item)
    }
    
    private func editContact(name: String?, surname: String?, number: String?) -> Contact? {
        self.oldContact = ContactsManager.shared.updateItem(item: oldContact!, newName: name, newSurname: surname, newNumber: number)
        return oldContact
    }
    
    
}
