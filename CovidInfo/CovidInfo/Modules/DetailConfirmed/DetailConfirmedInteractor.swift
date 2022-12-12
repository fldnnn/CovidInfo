//
//  DetailConfirmedInteractor.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation
import Alamofire

class DetailConfirmedInteractor: PresenterToInteractorDetailConfirmedProcotol {
    var detailConfirmedPresenter: InteractorToPresenterDetailConfirmedProcotol?
    var codeValue = UserDefaults.standard.string(forKey: "codeValue")
    
    func getDetailConfirmed() {
        AF.request("https://public.richdataservices.com/rds/api/query/covid19/jhu_country/tabulate?dims=year_stamp,cnt_confirmed&groupby=year_stamp&measure=cnt_confirmed:SUM(cnt_confirmed)&where=(iso3166_1=\(codeValue!))&orderby=year_stamp%20ASC&format=amcharts&limit=5000", method: .get).response { [weak self] response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(DetailConfirmedData.self, from: data)
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {return}
                        guard let dataProvider = response.dataProvider else {return}
                        self.detailConfirmedPresenter?.didDataFetch(with: dataProvider)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
