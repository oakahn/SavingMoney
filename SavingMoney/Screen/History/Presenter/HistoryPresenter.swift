//
//  HistoryPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import FirebaseFirestore
import ObjectMapper

protocol HistoryPresenterProtocol {
    func getHistory()
}

class HistoryPresenter {
    var view: HistoryVCProtocol?
    
    init(_ view: HistoryVCProtocol) {
        self.view = view
    }
}

extension HistoryPresenter: HistoryPresenterProtocol {
    func getHistory() {
        let db = Firestore.firestore()
        db.collection("GetUserName").getDocuments { (snap, error) in
            guard error == nil else { return }
            guard let snapData = snap?.documents else { return }
            let resp = Mapper<Database>().map(JSONObject: snapData[0].data()[""])
        }
    }
}
