//
//  Route.swift
//  Taswak
//
//  Created by omar  on 10/03/2022.
//

import Foundation

enum AzanApiRoute {
    static let baseUrl = "https://api.aladhan.com/v1/timingsByCity"
    case city

    var description: String{
        switch self {
        case .city: return "?city=Cairo&country=Egypt&method=8"
        }
    }
}

