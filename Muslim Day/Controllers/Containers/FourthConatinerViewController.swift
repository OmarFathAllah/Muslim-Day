//
//  FourthConatinerViewController.swift
//  playSound
//
//  Created by omar  on 29/06/2022.
//

import UIKit

class FourthConatinerViewController: UIViewController {
    
    @IBOutlet var mainView: CircleProgressAnimatios!
    @IBOutlet var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strokeColor()
    }
    
    private func strokeColor(){
        mainView.trackLayer.strokeColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 0.08963127944)
        mainView.circularLayer.strokeColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 0.5085679714)
        mainView.progressLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        mainView.progressLayer.strokeColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
    }
    
}
