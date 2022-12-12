//
//  DetailConfirmedEntity.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation

// MARK: - DetailConfirmedData
struct DetailConfirmedData: Codable {
    let dataProvider: [ConfirmedData]?
}

// MARK: - DataProvider
struct ConfirmedData: Codable {
    let year_stamp: String?
    let cnt_confirmed: Int?
}
