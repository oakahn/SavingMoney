import UIKit
import Firebase
import FirebaseDatabase

protocol CreateTransferPresenterProtocol {
    func submitTransfer(_ createModel: CreateModel, _ setLineStruct: SetLineStruct)
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
    
    func submitTransfer(_ createModel: CreateModel, _ setLineStruct: SetLineStruct) {
        let dateKeys = ExtensionPresenter().cutDateTime(date: createModel.dateKey)[0]
        dbReference?.child(dateKeys).observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.value as? [String]
            if (dic == nil) {
                let data: [String] = [self.createInsert(createModel)]
                self.dbReference?.child(dateKeys).setValue(data)
                self.updateValue(createModel, setLineStruct: setLineStruct)
                return
            }
            guard var dictionary = snapshot.value as? [String] else { return }
            dictionary.append(self.createInsert(createModel))
            self.dbReference?.child(dateKeys).setValue(dictionary)
            self.updateValue(createModel, setLineStruct: setLineStruct)
        })
    }
}

extension CreateTransferPersenter {
    
    private func createInsert(_ input: CreateModel) -> String {
        return input.type + "|" + input.catagory + "|" + input.amount + "|" + input.desc + "|" + input.dateKey
    }
    
    private func updateValue(_ createModel: CreateModel, setLineStruct: SetLineStruct) {
        updateCatagory(createModel: createModel)
        updateType(createModel: createModel, setLineStruct: setLineStruct)
    }
    
    private func updateType(createModel: CreateModel, setLineStruct: SetLineStruct) {
        dbReference?.child(createModel.catagory).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let valueChild = snapshot.value as? Int else { return }
            guard let amount = Int(createModel.amount) else { return }
            self.dbReference?.child(createModel.catagory).setValue(valueChild + amount)
            self.submitSuccess(setLineStruct: setLineStruct)
        })
    }
    
    private func updateCatagory(createModel: CreateModel) {
        let type = checkType(createModel: createModel)
        dbReference?.child(type).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let valueChild = snapshot.value as? Int else { return }
            guard let amount = Int(createModel.amount) else { return }
            self.dbReference?.child(type).setValue(valueChild + amount)
        })
    }
    
    private func checkType(createModel: CreateModel) -> String {
        if createModel.type == "in" { return "receiveTotal" }
        return "payTotal"
    }
    
    private func submitSuccess(setLineStruct: SetLineStruct) {
        view?.redirectToSlipVC(setLineStruct: setLineStruct)
    }
}
