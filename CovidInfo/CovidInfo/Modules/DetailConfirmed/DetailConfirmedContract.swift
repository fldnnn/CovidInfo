//
//  DetailConfirmedContract.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation

protocol ViewToPresenterDetailConfirmedProcotol {
    var detailConfirmedInteractor: PresenterToInteractorDetailConfirmedProcotol? {get set}
    var detailConfirmedView: PresenterToViewDetailConfirmedProcotol? {get set}
    
    func viewDidLoad()
}

protocol PresenterToInteractorDetailConfirmedProcotol {
    var detailConfirmedPresenter: InteractorToPresenterDetailConfirmedProcotol? {get set}
    
    func getDetailConfirmed()
}

protocol InteractorToPresenterDetailConfirmedProcotol {
    
    func didDataFetch(with detailConfirmed: [ConfirmedData])
}

protocol PresenterToViewDetailConfirmedProcotol {
    func updateView(with detailConfirmed: [ConfirmedData])
}

protocol PresenterToRouterDetailConfirmedProcotol {
    static func createModule(ref: DetailConfirmedViewController)
}
