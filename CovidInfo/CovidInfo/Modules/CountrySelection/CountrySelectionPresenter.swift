//
//  CountrySelectionPresenter.swift
//  CovidInfo
//
//  Created by Fulden Onan on 9.12.2022.
//

import Foundation

class CountrySelectionPresenter: ViewToPresenterCountrySelectionProcotol {
    
    var countrySelectionInteractor: PresenterToInteractorCountrySelectionProcotol?
    
    var countrySelectionView: PresenterToViewCountrySelectionProcotol?
    
    func viewDidLoad() {
        countrySelectionInteractor?.getCountries()
    }
    
    func onSearchButtonPressed(with searchTerm: String) {
        countrySelectionInteractor?.searchCountry(with: searchTerm)
    }
}

extension CountrySelectionPresenter: InteractorToPresenterCountrySelectionProcotol {
    func didDataFetch(with countries: [Country]) {
        countrySelectionView?.updateView(with: countries)
    }
}
