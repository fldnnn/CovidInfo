//
//  DetailDeathViewController.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import UIKit
import Charts

class DetailDeathViewController: UIViewController {

    var detailDeathPresenterObject: ViewToPresenterDetailDeathProcotol?
    var detailDeathCount = [DataProvider]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailDeathRouter.createModule(ref: self)
        detailDeathPresenterObject?.viewDidLoad()
    }
    
    private func createLineChart() {
        let lineChart = LineChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        var dataEntries: [ChartDataEntry] = []
        var date = [String]()
        var count = 0
        let dateFormatter = DateFormatter()

        for detail in detailDeathCount {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let newDate = dateFormatter.date(from: detail.date_stamp!)
            dateFormatter.dateFormat = "MMMM-dd"
            let resultString = dateFormatter.string(from: newDate!)
            date.append(resultString)
            
            count += 1
            dataEntries.append(ChartDataEntry(x: Double(count - 1), y: Double(detail.cnt_death!)))
        }
 
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: date)
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.granularityEnabled = true
        lineChart.xAxis.granularity = 1.0
        
        let set = LineChartDataSet(entries: dataEntries, label: "Death / 2020")
        let data = LineChartData(dataSet: set)
        set.colors = [NSUIColor(ciColor: .init(red: 0.10, green: 0.20, blue: 0.70))]
        set.axisDependency = .left
        set.setColor(UIColor.black)
        set.lineWidth = 1.5
        set.fillAlpha = 1
        set.fillColor = .black
        set.mode = .cubicBezier
        set.highlightColor = .white
        set.drawCirclesEnabled = false
        set.drawCircleHoleEnabled = false
        data.setDrawValues(false)
        
        let yAxis = lineChart.leftAxis
        yAxis.labelPosition = .outsideChart
        
        
        lineChart.rightAxis.enabled = false
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.xAxis.labelRotationAngle = -90.0
        lineChart.xAxis.setLabelCount(10, force: false)
       
        lineChart.data = data
        lineChart.center = view.center
        
        lineChart.animate(xAxisDuration: 1.5)
        
        view.addSubview(lineChart)
    }
}

extension DetailDeathViewController: PresenterToViewDetailDeathProcotol {
    func updateView(with detailDeath: [DataProvider]) {
        detailDeathCount = detailDeath
        createLineChart()
    } 
}
