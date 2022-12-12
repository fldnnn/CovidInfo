//
//  DetailRecoveredPresenter.swift
//  CovidInfo
//
//  Created by Fulden Onan on 11.12.2022.
//

import Foundation

class DetailRecoveredPresenter: ViewToPresenterDetailRecoveredProcotol {
    
    var detailRecoveredInteractor: PresenterToInteractorDetailRecoveredProcotol?
    var detailRecoveredView: PresenterToViewDetailRecoveredProcotol?
    
    func viewDidLoad(with country: Country) {
        detailRecoveredInteractor?.getRecovered(with: country)
    }    
}

extension DetailRecoveredPresenter: InteractorToPresenterDetailRecoveredProcotol {
    func didDataFetch(with recoveredData: [DataProvide]) {
        detailRecoveredView?.updateView(with: recoveredData)
    }
}
