//
//  ViewController.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol StartAppProtocol: BaseVCProtocol {
    
}

class StartApp: BaseVC {

    lazy var presenter = StartAppPresenter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup() {
        
    }

    @IBAction func redirectToABC(_ sender: Any) {
        
    }
}

extension StartApp: StartAppProtocol {
    
}
