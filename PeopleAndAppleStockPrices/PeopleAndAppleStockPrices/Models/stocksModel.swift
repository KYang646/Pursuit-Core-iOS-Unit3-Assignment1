//
//  stocksModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Kimball Yang on 8/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ApplStockInfo: Decodable{
    //MARK: Properties
    var date: String
    var open: Double
    var close: Double
    var label: String
    var volume: Int
}
