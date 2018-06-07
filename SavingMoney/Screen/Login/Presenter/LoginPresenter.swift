//
//  LoginPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 7/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    var view: LoginVCProtocol?
    
    init(_ view: LoginVCProtocol) {
        self.view = view
    }
}
