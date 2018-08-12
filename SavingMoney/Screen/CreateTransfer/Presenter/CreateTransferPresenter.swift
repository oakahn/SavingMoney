import UIKit
import Firebase
import FirebaseDatabase

protocol CreateTransferPresenterProtocol {
    func submitTransfer(title: String, amount: String, type: String)
}

class CreateTransferPersenter {

    var view: CreateTransferVCProtocol?
    var dbReference: DatabaseReference?
    
    init(_ view: CreateTransferVCProtocol) {
        self.view = view
        dbReference = Database.database().reference()
    }
}

extension CreateTransferPersenter: CreateTransferPresenterProtocol {
    func submitTransfer(title: String, amount: String, type: String) {
        let childListItem = ["CaptionAmerica", "Ironman", "Hulk", "TheFlash",
                             "Thor", "Spiderman1"]
        for item in childListItem{
            guard let index = childListItem.index(of: item) else {
                return
            }
            let listItem = String(index)
            dbReference?.child("Human2").child(listItem).setValue(item)
        }
    }
}
