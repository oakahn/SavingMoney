//
//  HistoryVC.swift
//  SavingMoney
//
//  Created by chayarak on 1/6/2561 BE.
//  Copyright © 2561 chayarak. All rights reserved.
//

import UIKit
import Charts

protocol HistoryVCProtocol: BaseVCProtocol {
    func getHistorySuccess(_ firebaseModel: FirebaseModel)
}

class HistoryVC: BaseVC, ChartViewDelegate {
    
    lazy var presenter = HistoryPresenter(self)
    lazy var router = HistoryRouter(self)
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLoading(message: "", hasBg: true)
        pieChartView.delegate = self
        presenter.getHistory()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
        isHideTitle = true
        overrideBackButton()
        title = "History"
        setTitleColor(font: UIFont.kanitH8BoldStyle, color: UIColor.pinkTheme)
    }
    
    func setup() {
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        let dataEntries: [ChartDataEntry] = setDataEntries(dataPoints: dataPoints, values: values)
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Wonders")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        pieChartView.animate(xAxisDuration: TimeInterval(2))
        
        let colors: [UIColor] = GetColor().color
        pieChartDataSet.colors = colors
    }
    
    
}

extension HistoryVC: HistoryVCProtocol {
    func getHistorySuccess(_ firebaseModel: FirebaseModel) {
        hideLoading()
        let item = ListTransfer().keyChild

        let resp = [firebaseModel.bts,
                    firebaseModel.center,
                    firebaseModel.condo,
                    firebaseModel.fire,
                    firebaseModel.food,
                    firebaseModel.internet,
                    firebaseModel.piggy,
                    firebaseModel.shopping,
                    firebaseModel.water ]
        
        guard let value = resp as? [Double] else { return }
        print(value)
        
        setChart(dataPoints: item, values: value)
    }
}
