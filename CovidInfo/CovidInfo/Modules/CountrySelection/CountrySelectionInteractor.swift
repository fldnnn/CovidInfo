//
//  CountrySelectionInteractor.swift
//  CovidInfo
//
//  Created by Fulden Onan on 9.12.2022.
//

import Foundation
import Alamofire

class CountrySelectionInteractor: PresenterToInteractorCountrySelectionProcotol {
    var countrySelectionPresenter: InteractorToPresenterCountrySelectionProcotol?
    
    func getCountries() {
        AF.request("https://public.richdataservices.com/rds/api/query/covid19/jhu_country/tabulate?dims=iso3166_1&groupby=iso3166_1&inject=true&metadata=true&totals=true&format=amcharts&measure=cnt_recovered:SUM(cnt_recovered),cnt_confirmed:SUM(cnt_confirmed),cnt_death:SUM(cnt_death)&orderby=iso3166_1%20ASC", method: .get).response { [weak self] response in
            guard let self = self else {return}
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(Countries.self, from: data)
                    print(response)
                    DispatchQueue.main.async {
                        guard let dataProvider = response.dataProvider else {return}
                        self.countrySelectionPresenter?.didDataFetch(with: dataProvider)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchCountry(with searchTerm: String) {
        AF.request("https://public.richdataservices.com/rds/api/query/covid19/jhu_country/tabulate?dims=iso3166_1&groupby=iso3166_1&inject=true&metadata=true&totals=true&format=amcharts&measure=cnt_recovered:SUM(cnt_recovered),cnt_confirmed:SUM(cnt_confirmed),cnt_death:SUM(cnt_death)&orderby=iso3166_1%20ASC", method: .get).response { [weak self] response in
            guard let self = self else {return}
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(Countries.self, from: data)
                    print(response)
                    var searchedCountry = [Country]()
                    guard let dataProvider = response.dataProvider else {return}
                    for country in dataProvider {
                        if country.iso3166_1!.lowercased().contains(searchTerm.lowercased()) {
                            searchedCountry.append(country)
                        }
                    }
                    DispatchQueue.main.async {
                        self.countrySelectionPresenter?.didDataFetch(with: searchedCountry)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
//http://public.richdataservices.com/rds/api/catalog/covid19/jhu_country/classification/iso3166_1/codes
//https://public.richdataservices.com/rds/api/query/covid19/jhu_country/tabulate?dims=iso3166_1&groupby=iso3166_1&inject=true&metadata=true&totals=true&format=amcharts&measure=cnt_recovered:SUM(cnt_recovered),cnt_confirmed:SUM(cnt_confirmed)
//jshdbfjh
