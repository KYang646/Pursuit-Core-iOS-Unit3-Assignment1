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
    let results: [InfoWrapper]
    
static func getUsers(from data: Data) -> [InfoWrapper]{
    // this function takes in data and returns it into an array of InfoWrapper by decoding it
        do {
            let user = try
                JSONDecoder().decode(Contacts.self, from: data)
            return user.results
        } catch let decodeError {
            fatalError("could not decode info\(decodeError)")
        }
    }
    
}
    
    


struct InfoWrapper: Codable {
    let name: NameWrapper
    let location: LocationWrapper
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



