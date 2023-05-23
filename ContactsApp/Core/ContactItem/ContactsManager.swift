//
//  ContactsManager.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 22/05/2023.
//

import CoreData
import UIKit

class ContactsManager {
    private let context : NSManagedObjectContext
    
    static let shared = ContactsManager()
    
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func getAllItems() -> [Contact] {
        var models = [Contact]()
        let req = Contact.fetchRequest()
//        req.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false),NSSortDescriptor(key: "surname", ascending: false)]
//        let characters = "o"
//        req.predicate = NSPredicate(format: "name CONTAINS[cd] %@", argumentArray: [characters])
        do {
            models = try context.fetch(req)
        }
        catch {
            print(error)
        }
        return models
    }
    
    func createItem(name: String?, surname: String?, number: String?) -> Contact {
        let item = Contact(context: context)
        item.name = name!
        item.surname = surname!
        item.number = number!
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        return item
    }
    
    func updateItem(item: Contact?, newName: String?, newSurname: String?, newNumber: String?) -> Contact? {
        if let contact = item ?? nil {
            contact.name = newName!
            contact.surname = newSurname!
            contact.number = newNumber!
            do {
                try context.save()
            }
            catch {
                print(error)
            }
        }
        return item
    }
    
    func deleteItem(item: Contact) {
        context.delete(item)
        do {
            try context.save()
        }
        catch {
            print(error)
        }
    }
    
    func deleteAllItems() -> [Contact] {
        let models = getAllItems()
        for model in models {
            context.delete(model)
        }
        do {
            try context.save()
        }
        catch {
            print(error)
        }
        return []
    }

    
    
}
