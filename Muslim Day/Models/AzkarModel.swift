//
//  AzkarModel.swift
//  Azkar Almuslim
//
//  Created by omar  on 17/10/2021.
//

import Foundation
struct AzkarModel: Decodable {
    let arabic: [Azkar]
    
    enum CodingKeys: String, CodingKey{
        case arabic = "العربية"
    }
}

struct Azkar : Decodable {
    let ID: Int
    let TITLE: String
    let AUDIO_URL: String
    let TEXT: String
}






