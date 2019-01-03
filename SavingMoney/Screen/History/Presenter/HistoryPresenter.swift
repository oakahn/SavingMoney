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
                let receiveTotal = detail.receiveTotal,
                let bts = detail.bts,
                let center = detail.center,
                let condo = detail.condo,
                let fire = detail.fire,
                let food = detail.food,
                let internet = detail.internet,
                let piggy = detail.piggy,
                let shopping = detail.shopping,
                let water = detail.water else { return }
            print(payTotal, receiveTotal)
            self.view?.getHistorySuccess(receiveTotal, payTotal)
        })
    }
}
