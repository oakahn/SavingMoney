//
//  CreateTransferRouter.swift
//  SavingMoney
//
//  Created by chayarak on 10/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation

protocol CreateTransferRouterProtocol {
    func redirectToSlipVC()
}

class CreateTransferRouter: BaseRouter, CreateTransferRouterProtocol {
    func redirectToSlipVC() {
        guard let story = getViewController(storyboardName: self.Slip) as? SlipVC else {
            return
        }
        story.models = "Super"
        redirectTo(viewController: story)
    }
}
