//
//  CircleProgressAnimatios.swift
//  playSound
//
//  Created by omar  on 25/06/2022.
//

import UIKit
class CircleProgressAnimatios: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCircularPath()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCircularPath()
    }
    
    let progressLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    let circularLayer = CAShapeLayer()
    
//    we can do somthing like the following to give values to stroke color or we can directly give the values in the view controller view did load
//    var progressColor = UIColor.white{
//        didSet{
//            progressLayer.strokeColor = progressColor.cgColor
//        }
//    }
//    var trackColor = UIColor.gray{
//        didSet{
//            trackLayer.strokeColor = trackColor.cgColor
//        }
//    }
//    
//    var circularColor = UIColor.gray{
//        didSet{
//            circularLayer.strokeColor = trackColor.cgColor
//        }
//    }

    
    func setCircularPath(){
        let circlPath = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: 110, startAngle: -(.pi / 2), endAngle: (.pi * 2) - (.pi / 2) , clockwise: true)
        trackLayer.path = circlPath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 20
        trackLayer.strokeEnd = 1
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlPath.cgPath
        progressLayer.fillColor = #colorLiteral(red: 0.0002247643279, green: 0.1538766623, blue: 0.2260068655, alpha: 1)
        progressLayer.lineWidth = 20
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: 150, startAngle: -(.pi / 2), endAngle: (.pi * 2) - (.pi / 2) , clockwise: true)
        circularLayer.path = circularPath.cgPath
        circularLayer.fillColor = UIColor.clear.cgColor
        circularLayer.lineWidth = 30
        circularLayer.strokeEnd = 1
        layer.addSublayer(circularLayer)
    }
//    the following function to be used if you want to animate automatically by calling the fun cion the circle progress stroke end emmediatly
    
//    func setProgressanimation(keyPath:String, duration: TimeInterval,value:CGFloat){
//        let animation = CABasicAnimation(keyPath: keyPath)
//        animation.fromValue = 0
////        animation.toValue = value
//        animation.duration = duration
//        progressLayer.strokeEnd = CGFloat(value)
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = .backwards
//        progressLayer.add(animation, forKey: "animation")
//
//    }
    
}
