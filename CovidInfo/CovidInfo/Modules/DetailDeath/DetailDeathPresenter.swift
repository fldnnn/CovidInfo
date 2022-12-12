//
//  DetailDeathPresenter.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation

class DetailDeathPresenter: ViewToPresenterDetailDeathProcotol {
    var detailDeathInteractor: PresenterToInteractorDetailDeathProcotol?
    var detailDeathView: PresenterToViewDetailDeathProcotol?
    
    func viewDidLoad() {
        detailDeathInteractor?.getDetailDeath()
    }
}

extension DetailDeathPresenter: InteractorToPresenterDetailDeathProcotol {
    func didDataFetch(with detailDeath: [DataProvider]) {
        detailDeathView?.updateView(with: detailDeath)
    }
}
