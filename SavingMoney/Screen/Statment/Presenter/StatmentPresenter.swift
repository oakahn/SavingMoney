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
        dbReference?.observeSingleEvent(of: .value, with: { snap in
            print(snap.children)
            print(snap.children.allObjects)
            
            guard let value = snap.children.allObjects as? [NSObject] else {
                return
            }
            
            print(value[1])
            
            guard let valueChild = value[1] as? NSObject else {
                return
            }
        })
    }
    
    private func setChild(child: String) {
        dbReference?.child(child)
    }
}
