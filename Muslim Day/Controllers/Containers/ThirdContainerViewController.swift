//
//  ThirdContainerViewController.swift
//  playSound
//
//  Created by omar  on 28/06/2022.
//

import UIKit

class ThirdContainerViewController: UIViewController {

    @IBOutlet var mainView: CircleProgressAnimatios!
    @IBOutlet var counterLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        strokeColor()
    }
    
    private func strokeColor(){
        mainView.trackLayer.strokeColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        mainView.circularLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        mainView.progressLayer.fillColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        mainView.progressLayer.strokeColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
    }
}
