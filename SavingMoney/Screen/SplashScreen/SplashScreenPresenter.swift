//
//  SplashScreenPresente.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation

class SplashScreenRouter: BaseRouter {
    func redirectToStartApp() {
        redirectTo(name: self.appstart)
    }
}
