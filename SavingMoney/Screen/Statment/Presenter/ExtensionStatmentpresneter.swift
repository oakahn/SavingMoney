//
//  ExtensionStatmentpresneter.swift
//  SavingMoney
//
//  Created by chayarak on 10/1/2562 BE.
//  Copyright © 2562 chayarak. All rights reserved.
//

import UIKit

extension StatmentPresenter {
    
    func convertArray(list: String) -> [String] {
        let item: [String] = list.components(separatedBy: "|")
        return [item[0], item[1], item[2], item[3], item[4]]
    }
}
