//
//  CountrySelectionRouter.swift
//  CovidInfo
//
//  Created by Fulden Onan on 9.12.2022.
//

import Foundation

class CountrySelectionRouter: PresenterToRouterCountrySelectionProcotol {
    static func createModule(ref: CountrySelectionViewController) {
        let presenter = CountrySelectionPresenter()
        
        ref.countryPresenterObject = presenter
        
        ref.countryPresenterObject?.countrySelectionInteractor = CountrySelectionInteractor()
        ref.countryPresenterObject?.countrySelectionView = ref
        
        ref.countryPresenterObject?.countrySelectionInteractor?.countrySelectionPresenter = presenter
    }
}
