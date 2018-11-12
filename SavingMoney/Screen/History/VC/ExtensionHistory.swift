import UIKit
import Charts

extension HistoryVC {
    func setDataEntries(dataPoints: [String], values: [Double]) -> [ChartDataEntry] {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: values[i])
            dataEntries.append(dataEntry)
        }
        return dataEntries
    }
}