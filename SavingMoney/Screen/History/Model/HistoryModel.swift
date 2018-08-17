import UIKit
import ObjectMapper

class HistoryModel: Mappable {
    
    var payTotal: Int?
    var receiveTotal: Int?
    
    var food: String?
    var car: String?
    var mobile: String?
    var fire: String?
    var water: String?
    var health: String?
    var internet: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        payTotal <- map["payTotal"]
        receiveTotal <- map["receiveTotal"]
        
        food <- map["food"]
        car <- map["car"]
        mobile <- map["mobile"]
        fire <- map["fire"]
        water <- map["water"]
        health <- map["health"]
        internet <- map["internet"]
    }
}
