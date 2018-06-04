//
//  EnumTransferVC.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import UIKit

extension TransferVC {
    func getImage(name: Int) -> UIImage {
        switch name {
        case 0:
            return UIImage(named: "foodImage") ?? UIImage()
        case 1:
            return UIImage(named: "carImage") ?? UIImage()
        case 2:
            return UIImage(named: "mobileImage") ?? UIImage()
        case 3:
            return UIImage(named: "fireImage") ?? UIImage()
        case 4 :
            return UIImage(named: "waterImage") ?? UIImage()
        case 5:
            return UIImage(named: "drugImage") ?? UIImage()
        case 6:
            return UIImage(named: "internetImage") ?? UIImage()
        default:
            return UIImage()
        }
    }
    
    func getName(name: Int) -> String {
        switch name {
        case 0:
            return "ค่าอาหาร"
        case 1:
            return "การเดินทาง"
        case 2:
            return "ค่าโทรศัพท์มือถือ"
        case 3:
            return "ค่าไฟ"
        case 4 :
            return "ค่าน้ำ"
        case 5:
            return "สุขภาพ"
        case 6:
            return "internet"
        default:
            return ""
        }
    }
}

