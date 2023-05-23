//
//  Contact+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 23/05/2023.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var surname: String?
    @NSManaged public var callHistory: NSSet?

}

// MARK: Generated accessors for callHistory
extension Contact {

    @objc(addCallHistoryObject:)
    @NSManaged public func addToCallHistory(_ value: CallHistory)

    @objc(removeCallHistoryObject:)
    @NSManaged public func removeFromCallHistory(_ value: CallHistory)

    @objc(addCallHistory:)
    @NSManaged public func addToCallHistory(_ values: NSSet)

    @objc(removeCallHistory:)
    @NSManaged public func removeFromCallHistory(_ values: NSSet)

}

extension Contact : Identifiable {

}
