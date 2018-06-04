//
//  HistoryPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation

protocol HistoryPresenterProtocol {
    
}

class HistoryPresenter {
    var view: HistoryVCProtocol?
    
    init(_ view: HistoryVCProtocol) {
        self.view = view
    }
}

extension HistoryPresenter: HistoryPresenterProtocol {
    
}