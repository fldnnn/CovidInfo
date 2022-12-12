//
//  DetailDeathInteractor.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation
import Alamofire

class DetailDeathInteractor: PresenterToInteractorDetailDeathProcotol {
    var detailDeathPresenter: InteractorToPresenterDetailDeathProcotol?
    var codeValue = UserDefaults.standard.string(forKey: "codeValue")
    
    func getDetailDeath() {
        AF.request("https://public.richdataservices.com/rds/api/query/covid19/jhu_country/select?cols=date_stamp,cnt_death&where=(iso3166_1=\(codeValue!))AND(year_stamp=2020)&format=amcharts&limit=5000", method: .get).response { [weak self] response in
            guard let self = self else {return}
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(DetailDeathCount.self, from: data)
                    DispatchQueue.main.async {
                        guard let dataProvider = response.dataProvider else {return}
                        self.detailDeathPresenter?.didDataFetch(with: dataProvider)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    } 
}
