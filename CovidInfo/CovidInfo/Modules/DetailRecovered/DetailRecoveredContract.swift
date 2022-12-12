//
//  DetailRecoveredContract.swift
//  CovidInfo
//
//  Created by Fulden Onan on 11.12.2022.
//

import Foundation

protocol ViewToPresenterDetailRecoveredProcotol {
    var detailRecoveredInteractor: PresenterToInteractorDetailRecoveredProcotol? {get set}
    var detailRecoveredView: PresenterToViewDetailRecoveredProcotol? {get set}
    
    func viewDidLoad(with country: Country)
}

protocol PresenterToInteractorDetailRecoveredProcotol {
    var detailRecoveredPresenter: InteractorToPresenterDetailRecoveredProcotol? {get set}
    
    func getRecovered(with country: Country)
}

protocol InteractorToPresenterDetailRecoveredProcotol {
    func didDataFetch(with recoveredData: [DataProvide])
}

protocol PresenterToViewDetailRecoveredProcotol {
    func updateView(with recoveredData: [DataProvide])
}

protocol PresenterToRouterDetailRecoveredProcotol {
    static func createModule(ref: DetailRecoveredViewController)
}
