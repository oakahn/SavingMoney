//
//  SplashScreen.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol SplashScreenVCProtocol: BaseVCProtocol {
    
}
class SplashScreenVC: BaseVC {
    
    var timer = Timer()
    var second = 2
    lazy var router = SplashScreenRouter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLoading(message: "", hasBg: false)
        runTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        second -= 1
        setup()
    }
    
    func setup() {
        if second == 0 {
            hideLoading()
            router.redirectToStartApp()
        }
    }
}
