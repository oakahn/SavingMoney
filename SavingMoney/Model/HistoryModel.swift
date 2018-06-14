//
//  HistoryModel.swift
//  SavingMoney
//
//  Created by chayarak on 10/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import ObjectMapper

class HistoryModel: Mappable {
    
    var history: [String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        history <- map["historyuser1"]
    }
}

class History: Mappable {
    
    var data1: String?
    var data2: String?
    var data3: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
}
