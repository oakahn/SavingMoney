//
//  TransferVC.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol TransferProtocol: BaseVCProtocol {
    
}

class TransferVC: BaseVC {
    
    lazy var presenter = TransferPresenter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isHideTitle = false
    }
}

extension TransferVC: TransferProtocol {
    
}
