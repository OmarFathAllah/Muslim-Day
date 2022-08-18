//
//  FirstContainerViewController.swift
//  playSound
//
//  Created by omar  on 28/06/2022.
//

import UIKit

class FirstContainerViewController: UIViewController {

    var clickNo: Float = 0.0
    
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var mainView: CircleProgressAnimatios!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strokeColor()
  
    }
    
    private func strokeColor(){
        mainView.trackLayer.strokeColor = #colorLiteral(red: 0.5375150442, green: 0.5358501077, blue: 0.5388236046, alpha: 0.3283451691)
        mainView.circularLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        mainView.progressLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        mainView.progressLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
