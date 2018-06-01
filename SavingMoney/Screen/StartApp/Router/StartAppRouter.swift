//
//  StartAppRouter.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol StartAppRouterProtocol {
    func redirectToTransferVC()
    func redirectToHistoryVC()
}

class StartAppRouter: BaseRouter, StartAppRouterProtocol {
    func redirectToHistoryVC() {
        redirectTo(name: self.history)
    }
    
    func redirectToTransferVC() {
        redirectTo(name: self.transfer)
    }
}
