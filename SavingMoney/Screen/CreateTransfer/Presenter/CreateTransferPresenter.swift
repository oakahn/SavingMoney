import UIKit
import Firebase
import FirebaseDatabase

protocol CreateTransferPresenterProtocol {
    func submitTransfer(dateKey: String, title: String, amount: String, type: String)
}

class CreateTransferPersenter {

    var view: CreateTransferVCProtocol?
    var dbReference: DatabaseReference?
    var postsKeys = [String]()
    
    init(_ view: CreateTransferVCProtocol) {
        self.view = view
        dbReference = Database.database().reference()
    }
    
    func cutDateTime(date: String) -> [String] {
        let date: [String] = date.components(separatedBy: " ")
        return [date[0], date[1]]
    }
}

extension CreateTransferPersenter: CreateTransferPresenterProtocol {
    func submitTransfer(dateKey: String, title: String, amount: String, type: String) {
        dbReference?.child("Oak").observeSingleEvent(of: .value, with: { (snapshot) in
            guard var dictionary = snapshot.value as? [String] else {
                return
            }
            let dateKeys = self.cutDateTime(date: dateKey)[0]
            dictionary.append(title + "|" + amount + "|" + type)
            self.dbReference?.child("Oak").child(dateKeys).setValue(dictionary)
            self.submitSuccess()
        })
    }
    
    func submitSuccess() {
        view?.redirectToSlipVC()
    }
}
