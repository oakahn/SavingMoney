import UIKit
import Firebase
import FirebaseDatabase

protocol CreateTransferPresenterProtocol {
    func submitTransfer(title: String, amount: String, type: String)
}

class CreateTransferPersenter {

    var view: CreateTransferVCProtocol?
    var dbReference: DatabaseReference?
    var postsKeys = [String]()
    
    init(_ view: CreateTransferVCProtocol) {
        self.view = view
        dbReference = Database.database().reference()
    }
}

extension CreateTransferPersenter: CreateTransferPresenterProtocol {
    func submitTransfer(title: String, amount: String, type: String) {
        dbReference?.child("superman").child("batman").observeSingleEvent(of: .value, with: { (snapshot) in
            guard var dictionary = snapshot.value as? [String] else { return }
            dictionary.append("cherprang")
            self.dbReference?.child("superman").child("batman").setValue(dictionary)
        })
    }
}
