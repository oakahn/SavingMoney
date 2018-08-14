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
}

extension CreateTransferPersenter: CreateTransferPresenterProtocol {
    func submitTransfer(dateKey: String, title: String, amount: String, type: String) {
        let dateKeys = ExtensionPresenter().cutDateTime(date: dateKey)[0]
        dbReference?.child("Oak").child(dateKeys).observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.value as? [String]
            if (dic == nil) {
                let data: [String] = [(title + "|" + amount + "|" + type)]
                self.dbReference?.child("Oak").child(dateKeys).setValue(data)
                self.submitSuccess()
                return
            }
            guard var dictionary = snapshot.value as? [String] else { return }
            dictionary.append(title + "|" + amount + "|" + type)
            self.dbReference?.child("Oak").child(dateKeys).setValue(dictionary)
            self.submitSuccess()
        })
    }
    
    func submitSuccess() {
        view?.redirectToSlipVC()
    }
}
