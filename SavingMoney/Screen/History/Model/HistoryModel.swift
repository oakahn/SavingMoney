import UIKit
import ObjectMapper

class HistoryModel: Mappable {
    
    var payTotal: String?
    var receiveTotal: String?
    
    var bts: String?
    var center: String?
    var condo: String?
    var fire: String?
    var food: String?
    var internet: String?
    var piggy: String?
    var shopping: String?
    var water: String?
    
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
