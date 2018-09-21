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
import ObjectMapper

protocol HistoryPresenterProtocol {
    func getHistory()
}

class HistoryPresenter {
    var view: HistoryVCProtocol?
    var dbReference: DatabaseReference?
    
    init(_ view: HistoryVCProtocol) {
        self.view = view
        dbReference = Database.database().reference().child("Oak")
    }
}

extension HistoryPresenter: HistoryPresenterProtocol {
    func getHistory() {
        dbReference?.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let res = snapshot.value as? NSObject else { return }
            guard let detail = Mapper<HistoryModel>().map(JSONObject: res) else { return }
            guard let payTotal = detail.payTotal,
                let receiveTotal = detail.receiveTotal else { return }
            print(payTotal, receiveTotal)
            self.view?.getHistorySuccess()
        })
    }
}
