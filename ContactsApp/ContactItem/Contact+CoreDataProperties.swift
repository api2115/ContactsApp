//
//  Contact+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 15/05/2023.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var number: String?

}

extension Contact : Identifiable {

}
