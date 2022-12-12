//
//  DetailRecoveredInteractor.swift
//  CovidInfo
//
//  Created by Fulden Onan on 11.12.2022.
//

import Foundation
import Alamofire

class DetailRecoveredInteractor: PresenterToInteractorDetailRecoveredProcotol {   
    var detailRecoveredPresenter: InteractorToPresenterDetailRecoveredProcotol?
    var codeValue: String?
    
    func getRecovered(with country: Country) {
        AF.request("http://public.richdataservices.com/rds/api/catalog/covid19/jhu_country/metadata/json", method: .get).response { [weak self] response in
            guard let self = self else {return}
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(CountryDetail.self, from: data)
                    
                        guard let classification = response.classifications else {return}
                        var countryCode: [Code]?
                        for countryDetail in classification {
                            countryCode = countryDetail.codes?.filter({
                                $0.name == country.iso3166_1
                            })
                        }
                    self.codeValue = countryCode?.first?.codeValue
                    if let codeValue = self.codeValue {
                        self.getRecoveredData(with: codeValue)
                        UserDefaults.standard.set(codeValue, forKey: "codeValue")
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func getRecoveredData(with codeValue: String?) {
        AF.request("https://public.richdataservices.com/rds/api/query/covid19/jhu_country/tabulate?dims=year_stamp,cnt_recovered&groupby=year_stamp&measure=cnt_recovered:SUM(cnt_recovered)&where=(iso3166_1=\(codeValue!))&orderby=year_stamp%20ASC&format=amcharts&limit=5000", method: .get).response { [weak self] response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(DetailRecoveredData.self, from: data)
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {return}
                        guard let dataProvider = response.dataProvider else {return}
                        self.detailRecoveredPresenter?.didDataFetch(with: dataProvider)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
        //https://public.richdataservices.com/rds/api/query/covid19/jhu_country/tabulate?dims=year_stamp,cnt_recovered&groupby=year_stamp&measure=cnt_recovered:SUM(cnt_recovered)&where=(iso3166_1=AF)&orderby=year_stamp ASC&format=amcharts&limit=5000
        
        //https://public.richdataservices.com/rds/api/query/covid19/jhu_country/select?cols=date_stamp,cnt_confirmed,cnt_death,cnt_recovered&where=(iso3166_1=\(codeValue!))&format=amcharts&limit=5000
    }
}
