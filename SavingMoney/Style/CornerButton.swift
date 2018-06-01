//
//  CornerButton.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

class CornerButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 7
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 7
    }
}
