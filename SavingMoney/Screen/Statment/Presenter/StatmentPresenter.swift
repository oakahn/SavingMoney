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
            self.getStatment(
                keyList: keyList.filter({ (item) -> Bool in
                    return self.clearUnuseKey(item)
                })
            )
        })
    }
    
    private func clearUnuseKey(_ item: String) -> Bool {
        for i in ListTransfer().unUseKey {
            if item == i { return false }
        }
        return true
    }
    
    private func getStatment(keyList: [String]) {
        print(keyList)
        for child in keyList {
            setChildCallback(child: child) { () in
                getResponseForChild()
            }
        }
    }
    
    private func getResponseForChild() {
        var listItem: [String] = []
        dbReference?.observeSingleEvent(of: .value, with: { (snap) in
            guard let value = snap.value as? [String] else { return }
            for i in value {
                listItem.append(i)
            }
        })
        view?.responseSuccess(listItem: listItem)
    }
    
    private func setChildCallback(child: String, completion: (_ result: ())->()) {
        dbReference = Database.database().reference().child("Oak").child(child)
        completion(())
    }
}
