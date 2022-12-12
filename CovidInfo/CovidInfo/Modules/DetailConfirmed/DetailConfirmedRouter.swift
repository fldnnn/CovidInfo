//
//  DetailConfirmedRouter.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation

class DetailConfirmedRouter: PresenterToRouterDetailConfirmedProcotol {
    static func createModule(ref: DetailConfirmedViewController) {
        let presenter = DetailConfirmedPresenter()
        
        ref.detailConfirmedPresenterObject = presenter
        
        ref.detailConfirmedPresenterObject?.detailConfirmedInteractor = DetailConfirmedInteractor()
        ref.detailConfirmedPresenterObject?.detailConfirmedView = ref
        
        ref.detailConfirmedPresenterObject?.detailConfirmedInteractor?.detailConfirmedPresenter = presenter
    }
}
