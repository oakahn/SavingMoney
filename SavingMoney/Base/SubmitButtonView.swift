//
//  SubmitOTPButtonView.swift
//  tungngern-ios
//
//  Created by chayarak on 24/4/2561 BE.
//  Copyright © 2561 pracharath. All rights reserved.
//

import UIKit

@IBDesignable class SubmitButtonKeyboardView: BaseXibView {
    @IBOutlet weak var submitButton: UIButton!
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        submitButton.layer.cornerRadius = 22.0
    }
}
