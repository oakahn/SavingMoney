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
}

extension LoginPresenter: LoginPresenterProtocol {
    
    
    func getFirebase(userName: String, password: String) {
        let db = Firestore.firestore()
        db.collection("Username").getDocuments { (snap, error) in
            if error != nil {
                
            } else {
                guard let snapData = snap?.documents else { return }
                for data in snapData {
                    let resp = Mapper<Database>().map(JSONObject: data.data())
                    guard let username = resp?.name?.user?.username,
                        let password = resp?.name?.user?.password else {
                        return
                    }
                    self.view?.getusernameAndPassword(user: username, pass: password)
                }
                
            }
        }
    }
    
}
