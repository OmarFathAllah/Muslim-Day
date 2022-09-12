//
//  DateHelper.swift
//  Muslim Day
//
//  Created by omar  on 09/09/2022.
//

import Foundation
struct DateHelper {
    static let shared = DateHelper()
    
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
    
    func currentDateAndTimeAsString()->String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy, h:mm a"
        let dateTimeString = dateFormatter.string(from: date)
        return dateTimeString
    }
    
    func currentDateAndTimeAsDate()->Date{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy, h:mm a"
//        dateFormatter.timeZone = TimeZone(identifier: "localTimeZoneName")

        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//        dateFormatter.timeZone = TimeZone(secondsFromGMT: 2*3600)
        return date
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
