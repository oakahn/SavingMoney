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
    
    lazy var presenter = HistoryPresenter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isHideTitle = true
        overrideBackButton()
        title = "History"
        setTitleColor(font: UIFont.kanitH8LightStyle, color: UIColor.pinkTheme)
    }
}

extension HistoryVC: HistoryVCProtocol {
    
}
