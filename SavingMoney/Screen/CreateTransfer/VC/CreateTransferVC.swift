//
//  CreateTransferVC.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol CreateTransferVCProtocol: BaseVCProtocol {
    
}

class CreateTransferVC: BaseVC {
    
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var noteText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var inoutSegment: UISegmentedControl!
    var caseTransfer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideBackButton()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() {
        noteText.becomeFirstResponder()
        noteText.text = caseTransfer
    }
    
    @IBAction func incomeOrOutcome(_ sender: Any) {
        let incomeOrOutcomeCase = inoutSegment.selectedSegmentIndex
        switch incomeOrOutcomeCase {
        case 0:
            setUpOutCome()
        case 1:
            setupIncome()
        default:
            return
        }
    }
    
    func setUpOutCome() {
        amountLabel.text = "จ่ายจำนวนเงิน"
    }
    
    func setupIncome() {
        amountLabel.text = "รับจำนวนเงิน"
    }
}

extension CreateTransferVC: CreateTransferVCProtocol {
    
}
