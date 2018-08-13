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
    lazy var presenter = CreateTransferPersenter(self)
    var submitButtonView: SubmitButtonKeyboardView?
    var type: String = ""
    let maxInputAmount = NSNumber(value:9999.99)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideBackButton()
        setupKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
        setUpOutCome()
    }
    
    @IBAction func incomeOrOutcome(_ sender: Any) {
        switch inoutSegment.selectedSegmentIndex {
        case 0:
            setUpOutCome()
        case 1:
            setupIncome()
        default:
            setUpOutCome()
        }
    }
    
    @objc func submitTransfers() {
        presenter.submitTransfer(title: noteText.text ?? "", amount: amountText.text ?? "", type: type)
    }
}

extension CreateTransferVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textfield = textField.text else { return false }
        if textfield.isEmpty { return true }
        if textfield == "." && textfield.isEmpty { return false }
        guard let amountValue = Double(textfield) else { return false }
        if amountValue > maxInputAmount.doubleValue {
            amountText.text?.removeLast()
            return false
        }
        return true
    }
}
