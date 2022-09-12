//
//  TimeManager.swift
//  playSound
//
//  Created by omar  on 09/06/2022.
//

import Foundation
struct TimeManager {
    static let shared = TimeManager()
    
//    to get current date
    func getCurrentMonth(){
        let date = Date()
        let calendarDate = Calendar.current.dateComponents([.day, .year, .month], from: date)
        let currentDay = calendarDate.day
        let currentMonth = calendarDate.month
        let currentYear = calendarDate.year
        print("currentDay:-->\(currentDay):, currentMonth--> \(currentMonth)::currentYear--> \(currentYear) )")


    }
}
