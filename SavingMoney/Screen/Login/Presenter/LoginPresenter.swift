//
//  LoginPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 7/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol LoginPresenterProtocol {
    func getFirebase(userName: String, password: String)
}

class LoginPresenter {
    
    var view: LoginVCProtocol?
    
    init(_ view: LoginVCProtocol) {
        self.view = view
    }
    
    func setFirebaseFailed() {
        view?.displayMessage(title: "", message: "")
    }
    
    func validateUsername(username: String, passqord: String) {
        
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func getFirebase(userName: String, password: String) {
        let db = Firestore.firestore()
        db.collection("GetUserName").getDocuments { (snap, error) in
            guard error == nil else { return }
            guard let snapData = snap?.documents else { return }
            let resp = Mapper<Database>().map(JSONObject: snapData[0].data()[userName])
            guard let user = resp?.username, let pass = resp?.password else { return }
            if password == pass && userName == user {
                self.view?.loginSuccess(user: user, pass: pass)
            } else {
                self.view?.displayMessage(title: "not contain \(user)", message: "")
            }
        }
    }
}
