//
//  MapDatabase.swift
//  SavingMoney
//
//  Created by chayarak on 8/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import ObjectMapper

class Database: Mappable {
    
    var username: String?
    var password: String?
    
    func mapping(map: Map) {
        
    }
    
    required init?(map: Map) {
        username <- map["username"]
        password <- map["password"]
    }
}
