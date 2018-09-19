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
    func redirectToCreatetransaction(caseTransfer: String, image: String)
}

class TransferRouter: BaseRouter, TransferRouterProtocol {
    func redirectToCreatetransaction(caseTransfer: String, image: String) {
        guard let createTransaction = getViewController(storyboardName: self.createTransfer) as? CreateTransferVC else {
            return
        }
        createTransaction.caseTransfer = caseTransfer
        createTransaction.image = image
        redirectTo(viewController: createTransaction)
    }
}
