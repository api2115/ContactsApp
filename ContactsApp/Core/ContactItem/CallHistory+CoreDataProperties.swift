//
//  CallHistory+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 23/05/2023.
//
//

import Foundation
import CoreData


extension CallHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CallHistory> {
        return NSFetchRequest<CallHistory>(entityName: "CallHistory")
    }

    @NSManaged public var date: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var icon: String?
    @NSManaged public var status: String?
    @NSManaged public var callType: String?
    @NSManaged public var contact: Contact?

}

extension CallHistory : Identifiable {

}
