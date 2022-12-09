//
//  CountrySelectionContract.swift
//  CovidInfo
//
//  Created by Fulden Onan on 9.12.2022.
//

import Foundation

protocol ViewToPresenterCountrySelectionProcotol {
    var countrySelectionInteractor: PresenterToInteractorCountrySelectionProcotol? {get set}
    var countrySelectionView: PresenterToViewCountrySelectionProcotol? {get set}
    
    func viewDidLoad()
    func onSearchButtonPressed(with searchTerm: String)
}

protocol PresenterToInteractorCountrySelectionProcotol {
    var countrySelectionPresenter: InteractorToPresenterCountrySelectionProcotol? {get set}
    
    func getCountries()
    func searchCountry(with searchTerm: String)
}

protocol InteractorToPresenterCountrySelectionProcotol {
    
    func didDataFetch(with countries: [Country])
}

protocol PresenterToViewCountrySelectionProcotol {
    func updateView(with countries: [Country])
}

protocol PresenterToRouterCountrySelectionProcotol {
    static func createModule(ref: CountrySelectionViewController)
}
