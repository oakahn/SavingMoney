//
//  HistoryPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import ObjectMapper
import Firebase
import FirebaseDatabase

protocol HistoryPresenterProtocol {
    func getHistory()
}

class HistoryPresenter {
    var view: HistoryVCProtocol?
    var dbReference: DatabaseReference?
    
    init(_ view: HistoryVCProtocol) {
        self.view = view
        dbReference = Database.database().reference()
    }
}

extension HistoryPresenter: HistoryPresenterProtocol {
    func getHistory() {
        dbReference?.child("Oak").observeSingleEvent(of: .value, with: { (snapshot) in
//            let dic = snapshot.value as? String
            print(snapshot.value)
//            if (dic == nil) {
//                print("NO History")
//                return
//            }
//            let dic2 = dic?.values
//            if dic2 == nil {
//                print("NO value2")
//                return
//            }
//            guard let data = snapshot.value as? [String] else { return }
//            print(data)
        })
    }
}
