//
//  DetailRecoveredRouter.swift
//  CovidInfo
//
//  Created by Fulden Onan on 11.12.2022.
//

import Foundation

class DetailRecoveredRouter: PresenterToRouterDetailRecoveredProcotol {
    static func createModule(ref: DetailRecoveredViewController) {
        let presenter = DetailRecoveredPresenter()
        
        ref.detailRecoveredPresenterObject = presenter
        
        ref.detailRecoveredPresenterObject?.detailRecoveredInteractor = DetailRecoveredInteractor()
        ref.detailRecoveredPresenterObject?.detailRecoveredView = ref
        
        ref.detailRecoveredPresenterObject?.detailRecoveredInteractor?.detailRecoveredPresenter = presenter
    }
}
