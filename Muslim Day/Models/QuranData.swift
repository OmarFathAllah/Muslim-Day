//
//  QuranData.swift
//  Azkar Almuslim
//
//  Created by omar  on 23/01/2022.
//


import Foundation

// MARK: - Welcome
struct QuranData: Decodable {
    let code: Int
    let status: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let ayahs: Ayahs
    let surahs: Surahs
    let sajdas: Sajdas
    let rukus, pages, manzils, hizbQuarters: HizbQuarters
    let juzs: HizbQuarters
}

// MARK: - Ayahs
struct Ayahs: Decodable {
    let count: Int
}

// MARK: - HizbQuarters
struct HizbQuarters: Decodable {
    let count: Int
    let references: [HizbQuartersReference]
}

// MARK: - HizbQuartersReference
struct HizbQuartersReference: Decodable {
    let surah, ayah: Int
}

// MARK: - Sajdas
struct Sajdas: Decodable {
    let count: Int
    let references: [SajdasReference]
}

// MARK: - SajdasReference
struct SajdasReference: Decodable {
    let surah, ayah: Int
    let recommended, obligatory: Bool
}

// MARK: - Surahs
struct Surahs: Decodable {
    let count: Int
    let references: [SurahsReference]
}

// MARK: - SurahsReference
struct SurahsReference: Decodable {
    let number: Int
    let name, englishName, englishNameTranslation: String
    let numberOfAyahs: Int
    let revelationType: RevelationType
}

enum RevelationType: String, Decodable {
    case meccan = "Meccan"
    case medinan = "Medinan"
}
