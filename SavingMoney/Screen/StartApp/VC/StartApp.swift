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
    lazy var router = StartAppRouter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        isHideTitle = true
    }
    
    func setup() {
        
    }

    @IBAction func redirectToTransfer(_ sender: Any) {
        router.redirectToTransferVC()
    }
    
    @IBAction func redirectToHistory(_ sender: Any) {
        router.redirectToHistoryVC()
    }
}

extension StartApp: StartAppProtocol {
    
}
