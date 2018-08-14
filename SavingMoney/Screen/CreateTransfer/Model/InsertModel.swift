import Foundation

struct InsertModel {
    var dateKey: String?
    var title: String?
    var amount: String?
    var type: String?
    var fullDateTime: String?
    
    init(dateKey: String, title: String, amount: String, type: String, fullDateTime: String) {
        self.dateKey = dateKey
        self.title = title
        self.amount = amount
        self.type = type
        self.fullDateTime = fullDateTime
    }
}
