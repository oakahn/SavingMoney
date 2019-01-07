import UIKit

extension CreateTransferVC {
    
    func setup() {
        noteText.becomeFirstResponder()
        catagory = caseTransfer ?? ""
        noteLabel.font = UIFont.kanitH8MediumStyle
        title = dateTimeNow
        amountText.delegate = self
    }
    
    func setEnableButton() {
        submitButtonView?.submitButton.backgroundColor = UIColor.pinkTheme
        submitButtonView?.submitButton.isEnabled = true
    }
    
    func setDisibleButton() {
        submitButtonView?.submitButton.backgroundColor = UIColor.lightGray
        submitButtonView?.submitButton.isEnabled = false
    }
    
    func setUpOutCome() {
        noteLabel.text = "รายละเอียดที่จ่าย"
        amountLabel.text = "จ่ายจำนวนเงิน"
        type = "out"
    }
    
    func setupIncome() {
        noteLabel.text = "รายละเอียดที่รับ"
        amountLabel.text = "รับจำนวนเงิน"
        type = "in"
    }
    
    func setupKeyboard() {
        let inputFrame = CGRect(x: 0, y: 0, width : UIScreen.main.bounds.size.width, height: 64)
        submitButtonView = SubmitButtonKeyboardView(frame: inputFrame)
        submitButtonView?.submitButton.setTitle("Confirm", for: .normal)
        amountText.inputAccessoryView = submitButtonView
        noteText.inputAccessoryView = submitButtonView
        submitButtonView?.submitButton.addTarget(self, action: #selector(submitTransfers), for: .touchUpInside)
        setEnableButton()
    }
}

extension CreateTransferVC: CreateTransferVCProtocol {
    func redirectToSlipVC(setLineStruct: SetLineStruct) {
        hideLoading()
        guard let message = setLineStruct.message,
            let stkId = setLineStruct.stickerId,
            let stkpackage = setLineStruct.stickerPackageId else {
                return
        }
        
        router.redirectToSlipVC(model: SlipModel(amount: amountText.text ?? "",
                                                 fee: "0",
                                                 date: dateTimeNow,
                                                 headerLabel: caseTransfer ?? "",
                                                 image: image ?? ""),
                                setLineStruct: SetLineStruct(message: message,
                                                             stickerId: stkId,
                                                             stickerPackageId: stkpackage))
    }
}
