import Foundation

class FirebaseModel {
    
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
    
    init(payTotal: Double,
         receiveTotal: Double,
         bts: Double,
         center: Double,
         condo: Double,
         fire: Double,
         food: Double,
         internet: Double,
         piggy: Double,
         shopping: Double,
         water: Double) {
        self.payTotal = payTotal
        self.receiveTotal = receiveTotal
        self.bts = bts
        self.center = center
        self.condo = condo
        self.fire = fire
        self.food = food
        self.internet = internet
        self.piggy = piggy
        self.shopping = shopping
        self.water = water
    }
}
