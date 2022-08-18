//
//  TimeManager.swift
//  playSound
//
//  Created by omar  on 09/06/2022.
//

import Foundation
struct TimeManager {
    static let shared = TimeManager()
    
    func currentDateAsString()->String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateTimeString = dateFormatter.string(from: date)
        return dateTimeString
    }
    
    func fromStringToDate(timeAsString:String,dateFormate:String)->Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormate
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let timeAsDate = dateFormatter.date(from: timeAsString)
        return timeAsDate
    }
    
    func currentDateAndTime()->String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy, h:mm a"
        let dateTimeString = dateFormatter.string(from: date)
        return dateTimeString
    }
    
    func dateToString(nextPrayerdate:Date,dateFormate:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormate
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let commingPrayertimeAsString = dateFormatter.string(from: nextPrayerdate)
//            print("commingPrayertimeAsString :: \(commingPrayertimeAsString)")
        return commingPrayertimeAsString
    }
}
