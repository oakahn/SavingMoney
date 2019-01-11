//
//  StatmentVC.swift
//  SavingMoney
//
//  Created by chayarak on 9/1/2562 BE.
//  Copyright © 2562 chayarak. All rights reserved.
//

import UIKit

protocol StatmentVCProtocol: BaseVCProtocol {
    func responseSuccess(listItem: [String])
}

class StatmentVC: BaseVC {
    
    @IBOutlet weak var statmentListTableView: UITableView!
    lazy var presenter = StatmentPresenter(self)
    var listItem: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getListStatment()
    }
    
    func setup() {
        statmentListTableView.delegate = self
        statmentListTableView.dataSource = self
    }
    
}

extension StatmentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let table = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StatmentTableViewCell else {
            return UITableViewCell()
        }
        table.statmentLabel.text = listItem[indexPath.row]
        return table
    }
}

extension StatmentVC: StatmentVCProtocol {
    func responseSuccess(listItem: [String]) {
        self.listItem = listItem
        statmentListTableView.reloadData()
    }
}
