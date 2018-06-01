//
//  StartAppPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation

protocol StartAppPresenterProtocol {
    
}

class StartAppPresenter {
    var view: StartAppProtocol?
    
    init(_ view: StartAppProtocol) {
        self.view = view
    }
}

extension StartAppPresenter: StartAppPresenterProtocol {
    
}
