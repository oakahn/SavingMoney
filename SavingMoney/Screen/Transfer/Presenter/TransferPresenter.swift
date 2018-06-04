//
//  TransferPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation

protocol TransferPresenterProtocol {
    
}

class TransferPresenter {
    
    var view: TransferProtocol?
    
    init(_ view: TransferVC) {
        self.view = view
    }
}

extension TransferPresenter: TransferPresenterProtocol {
    
}
