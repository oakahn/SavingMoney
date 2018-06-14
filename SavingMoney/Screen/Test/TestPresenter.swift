//
//  TestPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 14/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation

protocol TestPresenterProtocol {
    
}

class TestPresenter {
    
    var view: TestVCProtocol?
    
    init(_ view: TestVCProtocol) {
        self.view = view
    }
}

extension TestPresenter: TestPresenterProtocol {
    
}
