import UIKit

class CreateModel {
    
    var dateKey: String = ""
    var type: String = ""
    var catagory: String = ""
    var amount: String = ""
    var desc: String = ""
    
    init(dateKey: String, type: String, catagory: String, amount: String, desc: String) {
        self.dateKey = dateKey
        self.type = type
        self.catagory = catagory
        self.amount = amount
        self.desc = desc
    }
}
