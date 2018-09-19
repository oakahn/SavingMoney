struct SlipModel {
    var amount: String?
    var fee: String?
    var date: String?
    var headerLabel: String?
    var image: String?
    
    init(amount: String,
         fee: String,
         date: String,
         headerLabel: String,
         image: String) {
        self.amount = amount
        self.fee = fee
        self.date = date
        self.headerLabel = headerLabel
        self.image = image
    }
}
