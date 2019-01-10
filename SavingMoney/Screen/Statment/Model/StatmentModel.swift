import Foundation
import ObjectMapper

class StatmentModel: Mappable {
    
    var zero: String?
    var one: String?
    var two: String?
    var three: String?
    var four: String?
    var five: String?
    var six: String?
    var seven: String?
    var eight: String?
    var nine: String?
    var ten: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        zero <- map["0"]
        one <- map["1"]
        two <- map["2"]
        three <- map["3"]
        four <- map["4"]
        five <- map["5"]
        six <- map["6"]
        seven <- map["7"]
        eight <- map["8"]
        nine <- map["9"]
        ten <- map["10"]
    }
}
