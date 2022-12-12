//
//  DetailConfirmedViewController.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import UIKit
import Charts

class DetailConfirmedViewController: UIViewController {
    var detailConfirmedPresenterObject: ViewToPresenterDetailConfirmedProcotol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailConfirmedRouter.createModule(ref: self)
        detailConfirmedPresenterObject?.viewDidLoad()       
    }
    
    private func createChartConfirmed(with detailConfirmed: [ConfirmedData]) {
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        var entries = [BarChartDataEntry]()
        var date = [String]()
        var count = 0
        
        for detail in detailConfirmed {
            date.append(detail.year_stamp!)
            count += 1
            entries.append(BarChartDataEntry(x: Double(count - 1), y: Double(detail.cnt_confirmed!)))
        }

        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: date)
        
        let set = BarChartDataSet(entries: entries, label: "Confirmed")
        let data = BarChartData(dataSet: set)
        set.colors = [NSUIColor(ciColor: .init(red: 1.0, green: 0, blue: 0))]
       
        barChart.data = data
        barChart.center = view.center
        
        view.addSubview(barChart)
    }
}

extension DetailConfirmedViewController: PresenterToViewDetailConfirmedProcotol {
    func updateView(with detailConfirmed: [ConfirmedData]) {
        createChartConfirmed(with: detailConfirmed)
    }
}
