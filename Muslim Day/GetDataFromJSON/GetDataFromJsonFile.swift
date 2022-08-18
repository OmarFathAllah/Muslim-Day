//
//  GetDataFromJsonFile.swift
//  playSound
//
//  Created by omar  on 24/05/2022.
//

import Foundation

struct GetDataFromJsonFile {
    static var shared = GetDataFromJsonFile()
    var quranArray:[SurahsReference] = []
    var recitationArray:[Recitation] = []
//    var mainAzkarTitleArray : [Azkar] = []
    
//    get main title azkar data from JSON file
    mutating func getMainAzkarTitleFromJson()->[Azkar]?{
        guard let pathForJsonFile = Bundle.main.path(forResource: "AllAzkarTitles", ofType: "json")else{ return []}
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: pathForJsonFile))
            let datafromjson = try JSONDecoder().decode(AzkarModel.self, from: data)
            let mainAzkarTitleArray = datafromjson.arabic
            return mainAzkarTitleArray
        }catch let error{
            print(error)
        }
        return nil
    }

    //    get Quran Data data from json
    mutating func getQuranDataFromJson()->[SurahsReference]{
        guard let pathForJsonFile = Bundle.main.path(forResource: "QuranMetaJSON", ofType: "json")else{ return []}
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: pathForJsonFile))
            let datafromjson = try JSONDecoder().decode(QuranData.self, from: data)
            self.quranArray = datafromjson.data.surahs.references
        }catch let error{
            print(error)
        }
        return quranArray
    }
    
//    get Recitaions data from json
    
    mutating func getRecitationDataFromJson()->[Recitation]{
        guard let pathForJsonFile = Bundle.main.path(forResource: "MasahefMoratala", ofType: "json")else{ return []}
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: pathForJsonFile))
            let datafromjson = try JSONDecoder().decode(MoshafMoratalRecitation.self, from: data)
//            print("datafrtom json: \(datafromjson)")
            self.recitationArray = datafromjson.recitations
        }catch let error{
            print(error)
        }
        return recitationArray
    }
}

