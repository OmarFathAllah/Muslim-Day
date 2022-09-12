//
//  Date+Extension.swift
//  Muslim Day
//
//  Created by omar  on 09/09/2022.
//

import Foundation
extension Date {
    // return date components as Date
    func get(components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
// return date components as integer
    func get(component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
