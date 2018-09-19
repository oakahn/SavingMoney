//
//  CreateTransferRouter.swift
//  SavingMoney
//
//  Created by chayarak on 10/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation

protocol CreateTransferRouterProtocol {
    func redirectToSlipVC(model: SlipModel)
}

class CreateTransferRouter: BaseRouter, CreateTransferRouterProtocol {
    func redirectToSlipVC(model: SlipModel) {
        guard let story = getViewController(storyboardName: self.Slip) as? SlipVC else {
            return
        }
        story.models = model
        redirectTo(viewController: story)
    }
}
