//
//  LoginVC.swift
//  SavingMoney
//
//  Created by chayarak on 7/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit
import FirebaseAuth

protocol LoginVCProtocol: BaseVCProtocol {
    
}

class LoginVC: BaseVC {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    lazy var presenter = LoginPresenter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LoginVC: LoginVCProtocol {
    
}
