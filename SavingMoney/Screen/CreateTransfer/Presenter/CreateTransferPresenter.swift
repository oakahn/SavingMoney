import UIKit
import Firebase
import FirebaseDatabase

protocol CreateTransferPresenterProtocol {
    func submitTransfer(_ createModel: CreateModel)
    func setupModel(_ model: HistoryModel)
}

class CreateTransferPersenter {

    var view: CreateTransferVCProtocol?
    var dbReference: DatabaseReference?
    
    init(_ view: CreateTransferVCProtocol) {
        self.view = view
        dbReference = Database.database().reference().child("Oak")
    }
}

extension CreateTransferPersenter: CreateTransferPresenterProtocol {
    
    func setupModel(_ model: HistoryModel) {
        
    }
    
    func submitTransfer(_ createModel: CreateModel) {
        let dateKeys = ExtensionPresenter().cutDateTime(date: createModel.dateKey)[0]
        dbReference?.child(dateKeys).observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.value as? [String]
            if (dic == nil) {
                let data: [String] = [self.createInsert(createModel)]
                self.dbReference?.child(dateKeys).setValue(data)
                self.updateValueFirebase()
                return
            }
            guard var dictionary = snapshot.value as? [String] else { return }
            dictionary.append(self.createInsert(createModel))
            self.dbReference?.child(dateKeys).setValue(dictionary)
            self.updateValueFirebase()
        })
    }
}

extension CreateTransferPersenter {
    
    func createInsert(_ input: CreateModel) -> String {
        return input.type + "|" + input.catagory + "|" + input.amount + "|" + input.desc
    }
    
    func submitSuccess() {
        view?.redirectToSlipVC()
    }
    
    func updateValueFirebase() {
        for i in ListTransfer().keyChild {
            updateValue(child: i)
        }
        self.submitSuccess()
    }
    
    func updateValue(child: String) {
        dbReference?.child(child).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let valueChild = snapshot.value as? String else { return }
            print(valueChild)
            self.dbReference?.child(child).setValue("0")
        })
    }
}
