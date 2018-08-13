//
//  SlipVC.swift
//  SavingMoney
//
//  Created by chayarak on 13/8/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol SlipVCProtocol: BaseVCProtocol {
    
}

class SlipVC: BaseVC {
    
    var models: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(models)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SlipVC: SlipVCProtocol {
    
}
