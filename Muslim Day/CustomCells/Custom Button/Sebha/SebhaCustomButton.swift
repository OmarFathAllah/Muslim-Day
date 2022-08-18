//
//  SebhaCustomButton.swift
//  playSound
//
//  Created by omar  on 14/06/2022.
//

import UIKit

class SebhaCustomButton: UIButton {
    
    @IBOutlet var sebhaCustomButton: UIView!
    @IBOutlet var buttonImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customButtonInit()
        buttonComponentsInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customButtonInit()
        buttonComponentsInit()
    }
 
    private func customButtonInit(){
        Bundle.main.loadNibNamed("SebhaView", owner: self, options: nil)
        self.sebhaCustomButton.frame = self.bounds
        self.sebhaCustomButton.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(self.sebhaCustomButton)
        }
    
    
    private func buttonComponentsInit(){
        buttonImage.layer.cornerRadius = 40
    }
}
