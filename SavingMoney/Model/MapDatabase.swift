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
    
    var name: Mapdatabase?
    
    init() {
       
    }
    
    func mapping(map: Map) {
        
    }
    
    required init?(map: Map) {
        name <- map["Name"]
    }
}

class Mapdatabase: Mappable {
    
    var user: info?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        user <- map["user1"]
    }
}

class info: Mappable {
    
    var username: String?
    var password: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        username <- map["username"]
        password <- map["password"]
    }
}
