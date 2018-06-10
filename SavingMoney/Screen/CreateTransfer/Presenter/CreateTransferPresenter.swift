//
//  CreateTransferPresenter.swift
//  SavingMoney
//
//  Created by chayarak on 10/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import ObjectMapper
import FirebaseFirestore

protocol CreateTransferPresenterProtocol {
    func getHistorySaving()
}

class CreateTransferPersenter {

    var view: CreateTransferVCProtocol?
    
    init(_ view: CreateTransferVCProtocol) {
        self.view = view
    }
    
    func xx() -> [String:Any]{
        let docData: [String: Any] = [
            "stringExample": "Hello world!",
            "booleanExample": true,
            "numberExample": 3.14159265,
            "dateExample": NSDate(),
            "arrayExample": [5, true, "hello"],
            "nullExample": NSNull(),
            "objectExample": [
                "a": 5,
                "b": [
                    "nested": "foo"
                ]
            ]
        ]
        return docData
    }
}

extension CreateTransferPersenter: CreateTransferPresenterProtocol {
    
    func getHistorySaving() {
        let db = Firestore.firestore().collection("History")
        db.getDocuments { (snap, error) in
            guard error == nil else { return }
            guard let snapData = snap?.documents else { return }
            let resp = Mapper<HistoryModel>().map(JSONObject: snapData[0].data())
            print(resp?.history?.count)
        }
    }
}

struct ListItem {
    var date: String?
    var type: String?
    var amount: [String]?
    
    init(date: String, type: String, amount: [String]) {
        self.date = date
        self.type = type
        self.amount = amount
    }
}
