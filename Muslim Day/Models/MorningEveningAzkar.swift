//
//  Morning&EveningAzkar.swift
//  Azkar Almuslim
//
//  Created by omar  on 04/11/2021.
//

import Foundation

struct AzkarData : Decodable {
    
    let ID: Int
    let Text: String
    var repeatNo: Int
    let audioURl: String

    enum CodingKeys: String, CodingKey{
        case ID
        case repeatNo = "REPEAT"
        case Text = "ARABIC_TEXT"
        case audioURl = "AUDIO"
    }
}

struct MorningEveningAzkar: Decodable {

    var array: [AzkarData]

    // Define DynamicCodingKeys type needed for creating
    // decoding container from JSONDecoder
     struct DynamicCodingKeys: CodingKey {

        // Use for string-keyed dictionary
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        // Use for integer-keyed dictionary
        var intValue: Int?
        init?(intValue: Int) {
            // We are not using this, thus just return nil
            return nil
        }
    }

    init(from decoder: Decoder) throws {

        // 1
        // Create a decoding container using DynamicCodingKeys
        // The container will contain all the JSON first level key
//        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var tempArray = [AzkarData]()

        // 2
        // Loop through each key (student ID) in container
        for key in container.allKeys {

            // Decode Student using key & keep decoded Student object in tempArray
            let decodedObject = try container.decode([AzkarData].self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
//            tempArray.append(decodedObject)
            tempArray = decodedObject
        }

        // 3
        // Finish decoding all Student objects. Thus assign tempArray to array.
        array = tempArray
    }
}


// Old Way for medel to parse json in and this way is avey bad one because it require more lines of coding

//struct MorningEveningAzkar: Decodable {
//
//    let MorningAndEvening1: [AzkarData]?
//    let MorningAndEvening2: [AzkarData]?
//    let MorningAndEvening3: [AzkarData]?
//    let MorningAndEvening4: [AzkarData]?
//    let MorningAndEvening5: [AzkarData]?
//    let MorningAndEvening6: [AzkarData]?
//
//    enum CodingKeys: String, CodingKey{
//        case MorningAndEvening1 = "أذكار الصباح والمساء"
//        case MorningAndEvening2 = "أذكار النوم"
//        case MorningAndEvening3 = "أذكار الاستيقاظ من النوم"
//        case MorningAndEvening4 = "دعاء دخول الخلاء"
//        case MorningAndEvening5 = "دعاء الخروج من الخلاء"
//        case MorningAndEvening6 = "الذكر قبل الوضوء"
//
//    }
//
//}




 

