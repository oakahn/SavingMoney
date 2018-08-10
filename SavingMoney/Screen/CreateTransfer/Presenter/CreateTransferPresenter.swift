//
//  CreateTransferPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 10/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import ObjectMapper

protocol CreateTransferPresenterProtocol {
    func submitTransfer(title: String, message: String)
}

class CreateTransferPersenter {

    var view: CreateTransferVCProtocol?
    
    init(_ view: CreateTransferVCProtocol) {
        self.view = view
    }
}

extension CreateTransferPersenter: CreateTransferPresenterProtocol {
    
    func submitTransfer(title: String, message: String) {
        
    }
}
