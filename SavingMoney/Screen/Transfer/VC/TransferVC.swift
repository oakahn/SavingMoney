//
//  TransferVC.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit

protocol TransferProtocol: BaseVCProtocol {
    
}

class TransferVC: BaseVC {
    
    @IBOutlet weak var listTransferTableView: UITableView!
    lazy var presenter = TransferPresenter(self)
    lazy var router = TransferRouter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        listTransferTableView.backgroundColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isHideTitle = false
        overrideBackButton()
        title = "List Transfer"
        setTitleColor(font: UIFont.kanitH8LightStyle, color: UIColor.pinkTheme)
    }
    
    func setup() {
        listTransferTableView.delegate = self
        listTransferTableView.dataSource = self
    }
}

extension TransferVC: TransferProtocol {
    
}

extension TransferVC: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListTransfer().listItem.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTransferCell else {
            return UITableViewCell()
        }
        cell.listTransfer.text = getName(name: indexPath.row)
        cell.listImageTransfer.image = getImage(name: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.redirectToCreatetransaction(caseTransfer: getName(name: indexPath.row))
    }
}
