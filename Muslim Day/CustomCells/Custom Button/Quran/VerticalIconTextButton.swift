
//  VerticalIconTextButton.swift
//  playSound
//  Created by omar  on 13/06/2022.


import UIKit

class VerticalIconTextButton: UIButton {
    @IBOutlet var customButton: UIView!
    
    @IBOutlet var buttonImage: UIImageView!
    @IBOutlet var buttonTitle: UILabel!
    
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
        Bundle.main.loadNibNamed("View", owner: self, options: nil)
        self.customButton.frame = self.bounds
        self.customButton.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(self.customButton)
        }
    
    
    private func buttonComponentsInit(){
        buttonImage.layer.cornerRadius = 40
    }
}
