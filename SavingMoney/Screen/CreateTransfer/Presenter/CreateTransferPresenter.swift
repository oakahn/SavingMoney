import UIKit

protocol CreateTransferPresenterProtocol {
    func submitTransfer(title: String, amount: String, type: String)
}

class CreateTransferPersenter {

    var view: CreateTransferVCProtocol?
    
    init(_ view: CreateTransferVCProtocol) {
        self.view = view
    }
}

extension CreateTransferPersenter: CreateTransferPresenterProtocol {
    func submitTransfer(title: String, amount: String, type: String) {
        
    }
}
