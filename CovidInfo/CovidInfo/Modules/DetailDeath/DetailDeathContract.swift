//
//  DetailDeathContract.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation

protocol ViewToPresenterDetailDeathProcotol {
    var detailDeathInteractor: PresenterToInteractorDetailDeathProcotol? {get set}
    var detailDeathView: PresenterToViewDetailDeathProcotol? {get set}
    
    func viewDidLoad()
}

protocol PresenterToInteractorDetailDeathProcotol {
    var detailDeathPresenter: InteractorToPresenterDetailDeathProcotol? {get set}
    
    func getDetailDeath()
}

protocol InteractorToPresenterDetailDeathProcotol {
    
    func didDataFetch(with detailDeath: [DataProvider])
}

protocol PresenterToViewDetailDeathProcotol {
    func updateView(with detailDeath: [DataProvider])
}

protocol PresenterToRouterDetailDeathProcotol {
    static func createModule(ref: DetailDeathViewController)
}
