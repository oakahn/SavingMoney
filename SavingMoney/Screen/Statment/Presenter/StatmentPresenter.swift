//
//  StatmentPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 9/1/2562 BE.
//  Copyright © 2562 chayarak. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import ObjectMapper

protocol StatmemtPresenterProtocol {
    func getListStatment()
}

class StatmentPresenter {
    
    var view: StatmentVCProtocol?
    var dbReference: DatabaseReference?
    
    init(_ view: StatmentVCProtocol) {
        self.view = view
        dbReference = Database.database().reference().child("Oak")
    }
    
}

extension StatmentPresenter: StatmemtPresenterProtocol {
    
    func getListStatment() {
        dbReference?.observeSingleEvent(of: .value, with: { snapshot in
            var keyList: [String] = []
            for child in snapshot.children {
                guard let snap = child as? DataSnapshot else { return }
                let key = snap.key
                keyList.append(key)
            }
            self.getStatment(keyList: keyList)
        })
    }
    
    private func getStatment(keyList: [String]) {
        for child in keyList {
            setChildCallback(child: child) { () in
                getResponseForChild()
            }
        }
    }
    
    private func getResponseForChild() {
        //        var listItem: [String] = []
        print(dbReference)
        dbReference?.observeSingleEvent(of: .value, with: { (snap) in
            guard let value = snap.value else {
                return
            }
            
            print(value)
            
        })
    }
    
    private func setChildCallback(child: String, completion: (_ result: ())->()) {
        dbReference = Database.database().reference().child("Oak").child(child)
        completion(())
    }
}
