//
//  contactsModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Kimball Yang on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


enum ContactsJSON: Error {
    case decodingError(Error)
}

struct Contacts: Codable {
    
    
    
    let results: [ListInfo]
    
//    static func getContactsData(from data: Data) -> [ListInfo] {
//        do {
//            let contacts = try JSONDecoder().decode(ListInfo.self, from: data)
//            return contacts.results
//        } catch {
//            throw ContactsJSON.decodingError(error)
//        }
//    }
    
}

struct ListInfo: Codable {
    let name: [NameWrapper]
    let location: [LocationWrapper]
    let email: String
}

struct NameWrapper: Codable {
    let title: String
    let first: String
    let last: String
}

struct LocationWrapper: Codable {
    let city: String
    let state: String
}
