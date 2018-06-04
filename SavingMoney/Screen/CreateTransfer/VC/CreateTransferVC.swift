//
//  CreateTransferVC.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol CreateTransferVCProtocol: BaseVCProtocol {
    
}

class CreateTransferVC: BaseVC {
    
    var caseTransfer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(caseTransfer ?? "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension CreateTransferVC: CreateTransferVCProtocol {
    
}
