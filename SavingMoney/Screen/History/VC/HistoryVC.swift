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
    
}

class HistoryVC: BaseVC, ChartViewDelegate {
    
    lazy var presenter = HistoryPresenter(self)
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        pieChartView.noDataText = "Superman"
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        setChart(dataPoints: months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Wonders")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        let colors: [UIColor] = [UIColor.chart1,
                                 UIColor.chart2,
                                 UIColor.chart3,
                                 UIColor.chart4,
                                 UIColor.chart5,
                                 UIColor.chart6,
                                 UIColor.chart7,]
        
        pieChartDataSet.colors = colors
    }
}

extension HistoryVC: HistoryVCProtocol {
    
}
