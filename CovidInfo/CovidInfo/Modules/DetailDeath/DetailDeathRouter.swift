//
//  DetailDeathRouter.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation

class DetailDeathRouter: PresenterToRouterDetailDeathProcotol {
    static func createModule(ref: DetailDeathViewController) {
        let presenter = DetailDeathPresenter()
        
        ref.detailDeathPresenterObject = presenter
        
        ref.detailDeathPresenterObject?.detailDeathInteractor = DetailDeathInteractor()
        ref.detailDeathPresenterObject?.detailDeathView = ref
        
        ref.detailDeathPresenterObject?.detailDeathInteractor?.detailDeathPresenter = presenter
    }
}
