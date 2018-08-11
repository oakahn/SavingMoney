//
//  CornerButton.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit
import Foundation

class CornerButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
//        layer.shadowColor = UIColor.orange.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
//        layer.masksToBounds = false
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.6
    }
}
