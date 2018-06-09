//
//  LoginVC.swift
//  SavingMoney
//
//  Created by chayarak on 7/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol LoginVCProtocol: BaseVCProtocol {
    func loginSuccess(user: String, pass: String)
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
    
    @IBAction func loginButton(_ sender: Any) {
        presenter.getFirebase(userName: userNameText.text ?? "", password: passwordText.text ?? "")
    }
}

extension LoginVC: LoginVCProtocol {
    func loginSuccess(user: String, pass: String) {
        displayMessage(title: "\(user)", message: "Success")
        print("Success")
    }
    
    
}
