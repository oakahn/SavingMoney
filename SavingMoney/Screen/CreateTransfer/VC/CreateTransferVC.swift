//
//  CreateTransferVC.swift
//  SavingMoney
//
//  Created by chayarak on 4/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol CreateTransferVCProtocol: BaseVCProtocol {
    func redirectToSlipVC(setLineStruct: SetLineStruct)
}

class CreateTransferVC: BaseVC {
    
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var noteText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var inoutSegment: UISegmentedControl!
    var caseTransfer: String?
    lazy var presenter = CreateTransferPersenter(self)
    lazy var router = CreateTransferRouter(self)
    var submitButtonView: SubmitButtonKeyboardView?
    var type: String = ""
    let maxInputAmount = NSNumber(value:10000)
    var dateTimeNow: String = ""
    var catagory: String = ""
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideBackButton()
        setupKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dateTimeNow = DateFormatComponent().getCurrentDate(destinationPattern: .fullDateTimeTH)
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
        displayLoading(message: "", hasBg: true)
        noteText.resignFirstResponder()
        amountText.resignFirstResponder()
        guard let amount = amountText.text, let note = noteText.text else { return }
        presenter.submitTransfer(CreateModel(dateKey: dateTimeNow,
                                             type: type,
                                             catagory: catagory,
                                             amount: amount,
                                             desc: note),
                                 SetLineStruct(message: note + "  " + amount + "  บาท",
                                               stickerId: "518",
                                               stickerPackageId: "2"))
    }
}

extension CreateTransferVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
