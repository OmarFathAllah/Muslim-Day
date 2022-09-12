//
//  CurrentTimingIndex.swift
//  Muslim Day
//
//  Created by omar  on 09/09/2022.
//

import Foundation
struct CurrentTimingIndex {
    static let shared = CurrentTimingIndex()
    func getTimingIndex(date:Date,n:Int)->Int{
        var index = 0
        let currentDay = date.get(component: .day)
        let daysArray = 1 ... n
        for i in daysArray{
            if i == currentDay{
                index = i - 1
//                print(index)
            }
        }
        return index
    }
}
