//
//  ReciterMp3Model.swift
//  playSound
//
//  Created by omar  on 30/05/2022.
//

import Foundation

// MARK: - Welcome
struct ReciterMp3Model: Decodable {
    let id: Int
    let title, type: String
    let addDate: Int
    let orginalItem, translationLanguage, sourceLanguage: String
//    let categoryInfo: CategoryInfo
//    let preparedBy: [PreparedBy]
    let attachments: [Attachmentss]
    let locales: [String]

    enum CodingKeys: String, CodingKey {
        case id, title, type
        case addDate = "add_date"
        case orginalItem = "orginal_item"
        case translationLanguage = "translation_language"
        case sourceLanguage = "source_language"
//        case categoryInfo = "category_info"
//        case preparedBy = "prepared_by"
        case attachments, locales
    }
}

// MARK: - Attachment
struct Attachmentss: Decodable {
    let id, order: Int
    let title, duration, size: String
//    let extensionType: ExtensionType
    let attachmentDescription: String
    let url: String
    let apiURL: String

    enum CodingKeys: String, CodingKey {
        case id, order, title, duration, size
//        case extensionType = "extension_type"
        case attachmentDescription = "description"
        case url
        case apiURL = "api_url"
    }
}

//enum ExtensionType: String, Codable {
//    case mp3 = "MP3"
//}

// MARK: - CategoryInfo
//struct CategoryInfo: Codable {
//    let id: Int
//    let title: String
//    let categoryInfoDescription: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case categoryInfoDescription = "description"
//    }
//}
//
//// MARK: - PreparedBy
//struct PreparedBy: Codable {
//    let id, sourceID: Int
//    let title, type, kind: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case sourceID = "source_id"
//        case title, type, kind
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
