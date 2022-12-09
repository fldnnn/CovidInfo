//
//  CountrySelectionEntity.swift
//  CovidInfo
//
//  Created by Fulden Onan on 9.12.2022.
//

import Foundation

struct Countries: Codable {
    let dataProvider: [Country]?
}

struct Country: Codable {
    let iso3166_1: String?
    let cnt_confirmed: Int?
    let cnt_recovered: Int?
    let cnt_death: Int?
}
