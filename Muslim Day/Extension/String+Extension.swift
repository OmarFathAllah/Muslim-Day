//
//  String+Extension.swift
//  Muslim Day
//
//  Created by omar  on 09/09/2022.
//

import Foundation
extension String{
    
//    remove (EET) from prayerTiming geted back from api
    func removeEETfromTiming()-> String{
        return self.replacingOccurrences(of: "(EET)", with:"")
    }
}
