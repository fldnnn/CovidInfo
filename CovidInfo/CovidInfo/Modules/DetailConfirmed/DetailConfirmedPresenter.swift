//
//  DetailConfirmedPresenter.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation

class DetailConfirmedPresenter: ViewToPresenterDetailConfirmedProcotol {
    var detailConfirmedInteractor: PresenterToInteractorDetailConfirmedProcotol?
    var detailConfirmedView: PresenterToViewDetailConfirmedProcotol?
    
    func viewDidLoad() {
        detailConfirmedInteractor?.getDetailConfirmed()
    } 
}

extension DetailConfirmedPresenter: InteractorToPresenterDetailConfirmedProcotol {
    func didDataFetch(with detailConfirmed: [ConfirmedData]) {
        detailConfirmedView?.updateView(with: detailConfirmed)
    }  
}
