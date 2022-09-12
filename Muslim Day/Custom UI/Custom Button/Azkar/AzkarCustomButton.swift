//
//  AzkarCustomButton.swift
//  playSound
//
//  Created by omar  on 14/06/2022.

import UIKit
class AzkarCustomButton: UIButton {
    
    @IBOutlet var azkarCustomButton: UIView!
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
        Bundle.main.loadNibNamed("AzkarView", owner: self, options: nil)
        self.azkarCustomButton.frame = self.bounds
        self.azkarCustomButton.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(self.azkarCustomButton)
        }
    
    
    private func buttonComponentsInit(){
        buttonImage.layer.cornerRadius = 40
    }
}
