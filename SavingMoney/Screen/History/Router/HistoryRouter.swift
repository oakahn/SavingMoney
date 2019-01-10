//
//  HistoryRouter.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import UIKit

protocol HistoryRouterProtocol {
    func goToStatment()
}

class HistoryRouter: BaseRouter, HistoryRouterProtocol {
    func goToStatment() {
        guard let story = getViewController(storyboardName: self.statment) as? StatmentVC else {
            return
        }
        redirectTo(viewController: story)
    }
}
