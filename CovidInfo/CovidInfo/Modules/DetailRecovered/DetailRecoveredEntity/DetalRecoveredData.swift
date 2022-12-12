//
//  DetalRecoveredData.swift
//  CovidInfo
//
//  Created by Fulden Onan on 11.12.2022.
//

import Foundation

//// MARK: - DetailRecoveredData
//struct DetailRecoveredData: Codable {
//    let dataProvider: [DataProvide]?
//}
//
//// MARK: - DataProvider
//struct DataProvide: Codable {
//    let date_stamp: String?
//    let cnt_confirmed, cnt_death, cnt_recovered : Int?

//    enum CodingKeys: String, CodingKey {
//        case date_stamp = "dateStamp"
//        case cnt_confirmed = "cntConfirmed"
//        case cnt_death = "cntDeath"
//        case cnt_recovered = "cntRecovered"
//    }
//}

// MARK: - DetailRecoveredData
struct DetailRecoveredData: Codable {
    let dataProvider: [DataProvide]?
}

// MARK: - DataProvider
struct DataProvide: Codable {
    let year_stamp: String?
    let cnt_recovered: Int?

//    enum CodingKeys: String, CodingKey {
//        case year_stamp = "yearStamp"
//        case cnt_recovered = "cntecovered"
//    }
}
