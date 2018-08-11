//
//  CornerUiView.swift
//  SavingMoney
//
//  Created by chayarak on 11/8/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import Foundation
import UIKit

class CornerUiView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 10.0
    }
}
