import UIKit
import ObjectMapper

class HistoryModel: Mappable {
    
    var dateKey: String?
    var payTotal: Int?
    var receiveTotal: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        payTotal <- map["payTotal"]
        receiveTotal <- map["receiveTotal"]
    }
}
