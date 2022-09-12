//
//  QeblaCustomButton.swift
//  playSound
//
//  Created by omar  on 14/06/2022.
//

import UIKit

class QeblaCustomButton: UIButton {
    

    @IBOutlet var qeblaCustomButton: UIView!
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
        Bundle.main.loadNibNamed("QeblaView", owner: self, options: nil)
        self.qeblaCustomButton.frame = self.bounds
        self.qeblaCustomButton.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(self.qeblaCustomButton)
        }
    
    
    private func buttonComponentsInit(){
        buttonImage.layer.cornerRadius = 40
    }
}
