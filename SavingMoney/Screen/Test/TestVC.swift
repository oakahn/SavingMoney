//
//  TestVC.swift
//  SavingMoney
//
//  Created by chayarak on 14/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol TestVCProtocol: BaseVCProtocol {
    
}

class TestVC: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TestVC: TestVCProtocol {
    
}
