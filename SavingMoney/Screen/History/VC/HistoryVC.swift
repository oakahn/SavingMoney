//
//  HistoryVC.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol HistoryVCProtocol: BaseVCProtocol {
    
}

class HistoryVC: BaseVC {
    
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

extension HistoryVC: HistoryVCProtocol {
    
}
