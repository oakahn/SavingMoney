//
//  StatmentVC.swift
//  SavingMoney
//
//  Created by chayarak on 9/1/2562 BE.
//  Copyright © 2562 chayarak. All rights reserved.
//

import UIKit

protocol StatmentVCProtocol: BaseVCProtocol {
    
}

class StatmentVC: BaseVC {
    
    lazy var presenter = StatmentPresenter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
//        presenter.getListStatment()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getListStatment()
    }
    
}

extension StatmentVC: StatmentVCProtocol {
    
}
