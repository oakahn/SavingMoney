//
//  TransferRouter.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import UIKit

protocol TransferRouterProtocol {
    func redirectToCreatetransaction(caseTransfer: String)
}

class TransferRouter: BaseRouter, TransferRouterProtocol {
    func redirectToCreatetransaction(caseTransfer: String) {
        guard let createTransaction = getViewController(storyboardName: self.appstart) as? CreateTransferVC else {
            return
        }
        createTransaction.caseTransfer = caseTransfer
        redirectTo(viewController: createTransaction)
    }
}
