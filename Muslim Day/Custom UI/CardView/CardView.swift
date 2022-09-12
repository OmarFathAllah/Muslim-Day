//
//  CardStackView.swift
//  playSound
//
//  Created by omar  on 02/06/2022.
//

import Foundation
import UIKit
class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = .zero
        layer.cornerRadius = 10
//        layer.shadowOpacity = 0.3
//        layer.shadowRadius = 6
       
    }
}
