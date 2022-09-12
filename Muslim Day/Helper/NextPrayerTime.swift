//
//  NextPrayerTime.swift
//  Muslim Day
//
//  Created by omar  on 10/09/2022.
//

import Foundation
struct NextPrayerTime {
    static let shared = NextPrayerTime()
    
    // MARK: -  prayer Time As Date

//    to convert prayer time from string coming from api to date after adding curent date "dd MM YYYY" to be able to compare with the current date and time to determine which is larger to determin the comming prayer.
    func prayerTimeAsDate(prayerTime:String)->Date?{
        let currentDateString = DateHelper.shared.currentDateAsString()
        let currentDateAndTimeFromApi = currentDateString + prayerTime
//        print(currentDateAndTimeFromApi)
        let prayerTimeAsDate = DateHelper.shared.fromStringToDate(timeAsString: currentDateAndTimeFromApi, dateFormate: "dd-MM-yyyyHH:mm")
//        print("date as date:--> \(prayerTimeAsDate)")
        return prayerTimeAsDate
    }
    
    // MARK: -  iterate prayer timing
    
//    to iterate or for loop on the Prayer Timing for Month Model Struct properities to be able to make for loop to be able to compare dates and times to determine the comming prayer
    func getNextPrayerByIteratePrayerTiming(prayertimingModel:Timings,currentDate:Date)->IterateTimingModel?{
        let reflection = Mirror(reflecting: prayertimingModel)
        let children = reflection.children
        for onePrayer in children where (onePrayer.label != "Imsak" && onePrayer.label != "Midnight" && onePrayer.label != "Lastthird" && onePrayer.label != "Firstthird"){
            let prayerTimeString = "\(onePrayer.value)".removeEETfromTiming()
            if let prayerTimeDate = prayerTimeAsDate(prayerTime: prayerTimeString){
//                print("\(onePrayer.label)prayerTimeDate.value--> \(prayerTimeDate)")
//                print("currentDate.value--> \(currentDate)")
                if prayerTimeDate > currentDate {
                    let timingModel = IterateTimingModel(prayerName: onePrayer.label!, paryerDate: prayerTimeDate)
                    return timingModel
                }
            }
        }
        return nil
    }
    
    // MARK: -  get next prayer
//    compare current date with current prayer date
    func getNextPrayer(currentDate:Date,prayerDate:Date)->Date{
        if prayerDate > currentDate {
            return prayerDate
        }
        return Date()
    }
   
}
