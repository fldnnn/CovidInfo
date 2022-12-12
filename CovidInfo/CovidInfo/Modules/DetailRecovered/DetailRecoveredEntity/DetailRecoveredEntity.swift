//
//  DetailRecoveredEntity.swift
//  CovidInfo
//
//  Created by Fulden Onan on 11.12.2022.
//

import Foundation

// MARK: - CountryDetail
struct CountryDetail: Codable {
    let classifications: [Classification]?
    let recordLayout: RecordLayout?
}

// MARK: - Classification
struct Classification: Codable {
    let codes: [Code]?
    let id: String?
    let isPrivate: Bool?
    let lastUpdate: CodeLastUpdate?
    let reference: Bool?
    let revisionNumber: Int?
    let uri: String?
}

// MARK: - Code
struct Code: Codable {
    let codeValue: String?
    let isPrivate: Bool?
    let lastUpdate: CodeLastUpdate?
    let name: String?
    let reference: Bool?
    let revisionNumber: Int?
    let uri: String?
}

enum CodeLastUpdate: String, Codable {
    case the20220801T195934587Z = "2022-08-01T19:59:34.587Z"
}

// MARK: - RecordLayout
struct RecordLayout: Codable {
    let isPrivate: Bool?
    let lastUpdate: String?
    let reference: Bool?
    let revisionNumber: Int?
    let uri: String?
    let variables: [Variable]?
}

// MARK: - Variable
struct Variable: Codable {
    let dataType: DataType?
    let variableDescription: String?
    let fixedStorageWidth: Int?
    let format, id: String?
    let index: Int?
    let isDimension: Bool?
    let isRequired: Bool?
    let label: String?
    let lastUpdate: VariableLastUpdate
    let name: String?
    let reference: Bool?
    let revisionNumber: Int?
    let storageType: StorageType?
    let uri: String?
    let classificationURI: String?
    let decimals: Int?
    let isMeasure: Bool?

    enum CodingKeys: String, CodingKey {
        case dataType
        case variableDescription = "description"
        case fixedStorageWidth, format, id, index, isDimension, isRequired, label, lastUpdate, name, reference, revisionNumber, storageType, uri
        case classificationURI = "classificationUri"
        case decimals, isMeasure
    }
}

enum DataType: String, Codable {
    case date = "DATE"
    case numeric = "NUMERIC"
    case text = "TEXT"
}

enum VariableLastUpdate: String, Codable {
    case the20220801T195817662Z = "2022-08-01T19:58:17.662Z"
}

enum StorageType: String, Codable {
    case date = "DATE"
    case int32 = "INT32"
    case string = "STRING"
}
