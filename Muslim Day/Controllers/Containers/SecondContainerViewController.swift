//
//  SecondContainerViewController.swift
//  playSound
//
//  Created by omar  on 28/06/2022.
//

import UIKit

class SecondContainerViewController: UIViewController {

    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var mainView: CircleProgressAnimatios!
    override func viewDidLoad() {
        super.viewDidLoad()

        strokeColor()
        
    }
    private func strokeColor(){
        mainView.trackLayer.strokeColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0.5121275565)
        mainView.circularLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        mainView.progressLayer.fillColor = #colorLiteral(red: 0.0004089818394, green: 0.06659574062, blue: 0.126303494, alpha: 1)
        mainView.progressLayer.strokeColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }

   

}
