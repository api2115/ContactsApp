//
//  DataDelegateprotocol.swift
//  ContactsApp
//
//  Created by Adam Pilarski on 16/05/2023.
//

import Foundation

protocol DataDelegateProtocol: AnyObject {
    func passData(data: Contact)
}
