import UIKit
import ObjectMapper

class HistoryModel: Mappable {
    
    var payTotal: Double?
    var receiveTotal: Double?
    
    var bts: Double?
    var center: Double?
    var condo: Double?
    var fire: Double?
    var food: Double?
    var internet: Double?
    var piggy: Double?
    var shopping: Double?
    var water: Double?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        payTotal <- map["payTotal"]
        receiveTotal <- map["receiveTotal"]
        
        bts <- map["bts"]
        center <- map["center"]
        condo <- map["condo"]
        fire <- map["fire"]
        food <- map["food"]
        internet <- map["internet"]
        piggy <- map["piggy"]
        shopping <- map["shopping"]
        water <- map["water"]
    }
}
