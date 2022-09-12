//
//  PrayerTimingForMonthModel.swift
//  Muslim Day
//
//  Created by omar  on 09/09/2022.
//

import Foundation
// MARK: - Welcome
struct PrayerTimingForMonthModel: Decodable {
    let code: Int
    let status: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Decodable {
    let timings: Timings
    let date: DateClass
    let meta: Meta
}

// MARK: - DateClass
struct DateClass: Decodable {
    let readable, timestamp: String
    let gregorian: Gregorian
    let hijri: Hijri
}

// MARK: - Gregorian
struct Gregorian: Decodable {
    let date: String
    let format: Format
    let day: String
    let weekday: GregorianWeekday
    let month: GregorianMonth
    let year: String
    let designation: Designation
}

// MARK: - Designation
struct Designation: Decodable {
    let abbreviated: Abbreviated
    let expanded: Expanded
}

enum Abbreviated: String, Decodable {
    case ad = "AD"
    case ah = "AH"
}

enum Expanded: String, Decodable {
    case annoDomini = "Anno Domini"
    case annoHegirae = "Anno Hegirae"
}

enum Format: String, Codable {
    case ddMmYyyy = "DD-MM-YYYY"
}

// MARK: - GregorianMonth
struct GregorianMonth: Decodable {
    let number: Int
    let en: PurpleEn
}

enum PurpleEn: String, Decodable {
    case september = "September"
}

// MARK: - GregorianWeekday
struct GregorianWeekday: Decodable {
    let en: String
}

// MARK: - Hijri
struct Hijri: Decodable {
    let date: String
    let format: Format
    let day: String
    let weekday: HijriWeekday
    let month: HijriMonth
    let year: String
    let designation: Designation
//    let holidays: [JSONAny]
}

// MARK: - HijriMonth
struct HijriMonth: Decodable {
    let number: Int
    let en: FluffyEn
    let ar: Ar
}

enum Ar: String, Decodable {
    case ربيعالأول = "رَبيع الأوّل"
    case صفر = "صَفَر"
}

enum FluffyEn: String, Decodable {
    case rabīAlAwwal = "Rabīʿ al-awwal"
    case ṣafar = "Ṣafar"
}

// MARK: - HijriWeekday
struct HijriWeekday: Decodable {
    let en, ar: String
}

// MARK: - Meta
struct Meta: Decodable {
    let latitude, longitude: Double
    let timezone: Timezone
    let method: Method
    let latitudeAdjustmentMethod: LatitudeAdjustmentMethod
    let midnightMode, school: MidnightMode
    let offset: [String: Int]
}

enum LatitudeAdjustmentMethod: String, Decodable {
    case angleBased = "ANGLE_BASED"
}

// MARK: - Method
struct Method: Decodable {
    let id: Int
    let name: Name
    let params: Params
    let location: Location
}

// MARK: - Location
struct Location: Decodable {
    let latitude, longitude: Double
}

enum Name: String, Decodable {
    case egyptianGeneralAuthorityOfSurvey = "Egyptian General Authority of Survey"
}

// MARK: - Params
struct Params: Decodable {
    let fajr, isha: Double

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case isha = "Isha"
    }
}

enum MidnightMode: String, Decodable {
    case standard = "STANDARD"
}

enum Timezone: String, Decodable {
    case africaCairo = "Africa/Cairo"
}

// MARK: - Timings
struct Timings: Decodable {
    let fajr, sunrise, dhuhr, asr: String
    let sunset, maghrib, isha, imsak: String
    let midnight, firstthird: String
//    let lastthird: Lastthird

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case sunrise = "Sunrise"
        case dhuhr = "Dhuhr"
        case asr = "Asr"
        case sunset = "Sunset"
        case maghrib = "Maghrib"
        case isha = "Isha"
        case imsak = "Imsak"
        case midnight = "Midnight"
        case firstthird = "Firstthird"
//        case lastthird = "Lastthird"
    }
}

enum Lastthird: String, Decodable {
    case the0146Eet = "01:46 (EET)"
    case the0147Eet = "01:47 (EET)"
}
