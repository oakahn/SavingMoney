//
//  EnumTransferVC.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import UIKit

struct ListTransfer {
    let listItem: [String] = ["foodImage",
                              "carImage",
                              "mobileImage",
                              "fireImage",
                              "waterImage",
                              "drugImage",
                              "internetImage"]
    
    let valueListTransfer: [String] = ["ค่าอาหาร",
                                       "การเดินทาง",
                                       "ค่าโทรศัพท์มือถือ",
                                       "ค่าไฟ",
                                       "ค่าน้ำ",
                                       "สุขภาพ",
                                       "ค่าอินเทอร์เน็ตหอ"]
}

extension TransferVC {
    func getImage(name: Int) -> UIImage {
        return UIImage(named: ListTransfer().listItem[name]) ?? UIImage()
    }
    
    func getName(name: Int) -> String {
        return ListTransfer().valueListTransfer[name]
    }
}

