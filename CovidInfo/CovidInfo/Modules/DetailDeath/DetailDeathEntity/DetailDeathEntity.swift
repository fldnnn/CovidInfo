//
//  DetailDeathEntity.swift
//  CovidInfo
//
//  Created by Fulden Onan on 12.12.2022.
//

import Foundation

// MARK: - DetailDeathCount
struct DetailDeathCount: Codable {
    let dataProvider: [DataProvider]?
}

// MARK: - DataProvide
struct DataProvider: Codable {
    let date_stamp: String?
    let cnt_death: Int?
}
