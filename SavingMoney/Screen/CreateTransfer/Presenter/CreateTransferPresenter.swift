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
                self.updateValueFirebase(createModel.catagory)
                return
            }
            guard var dictionary = snapshot.value as? [String] else { return }
            dictionary.append(self.createInsert(createModel))
            self.dbReference?.child(dateKeys).setValue(dictionary)
            self.updateValueFirebase(createModel.catagory)
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
    
    func updateValueFirebase(_ child: String) {
//        for i in ListTransfer().keyChild {
//            updateValue(child: i)
//        }
        updateValue(child: child)
//        submitSuccess()
    }
    
    func updateValue(child: String) {
        dbReference?.child(child).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let valueChild = snapshot.value as? String else { return }
            guard let valueInt = Int(valueChild) else { return }
            self.dbReference?.child(child).setValue(String(valueInt + 1))
            self.submitSuccess()
        })
    }
}
