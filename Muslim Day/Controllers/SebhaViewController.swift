//
//  SebhaViewController.swift
//  Azkar Almuslim
//
//  Created by omar  on 19/01/2022.
//

import UIKit

class SebhaViewController: UIViewController,UITextFieldDelegate, getSelectedZekr {
   
//    properities
    @IBOutlet var allAzkarButton:UIButton!
    @IBOutlet var zekrTitleLabel: UILabel!
    var sebhaZekrArray = [String]()
    var currentIndex = 0
    var zekrText = ""
    var totalCounter = 0
    var subCounter = 0
    var clickNo = 0
    var firstContainerVC:FirstContainerViewController?
    var secondContainerVC:SecondContainerViewController?
    var thirdContainerVC:ThirdContainerViewController?
    var fourthContainerVC:FourthConatinerViewController?
    
    @IBOutlet var fourthContainer: UIView!
    @IBOutlet var thirdContainer: UIView!
    @IBOutlet var secondContainer: UIView!
    @IBOutlet var firstContainer: UIView!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var backView: UIView!
    
//    view Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        buttonsAndViewsSetup()
    }
    
    private func addGesture(){
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(counterIncrease)))
    }
    
    private func buttonsAndViewsSetup(){
        backView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        zekrTitleLabel.layer.cornerRadius = 10
        zekrTitleLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        zekrTitleLabel.layer.borderWidth = 0
        
        resetBtn.layer.cornerRadius = 10
    }
    // MARK: -  sebha Counter Increase function and value of circle animation stroke

    @objc func counterIncrease() {
        let totalProgress:Float = 100.0
        clickNo += 1
        totalCounterNo()
        let value = CGFloat(clickNo) / CGFloat(totalProgress)
        if value <= 1{
            firstContainerVC?.mainView.progressLayer.strokeEnd = value
            secondContainerVC?.mainView.progressLayer.strokeEnd = value
            thirdContainerVC?.mainView.progressLayer.strokeEnd = value
            fourthContainerVC?.mainView.progressLayer.strokeEnd = value
        }else{
            clickNo = 0
            firstContainerVC?.mainView.progressLayer.strokeEnd = 0.0
            secondContainerVC?.mainView.progressLayer.strokeEnd = 0.0
            thirdContainerVC?.mainView.progressLayer.strokeEnd = 0.0
            fourthContainerVC?.mainView.progressLayer.strokeEnd = 0.0
        }
//        print("\(clickNo) & \(value)")
    }
    
    func getselectedZekr(zekr: String) {
        zekrTitleLabel.text = zekr
    }
    
    
    @IBAction func azkarListButtonPressed(_ sender: UIButton) {
        let desVC = storyboard?.instantiateViewController(identifier: SebhaAzkarListViewController.identifier)as! SebhaAzkarListViewController
        desVC.delegate = self
        present(desVC, animated: true, completion: nil)
    }
    
    // MARK: -  changing container due to changing segmented control value
    @IBAction func changeColorSegmentControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            updateContainerAndView(backViewColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), firstContainer: false, secondContainer: true, thirdContainer: true, fourthContainer: true, resetTintColor: .white, resetBackColor: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), allAzkarTinitColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), zekrTitleTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
           
        case 1:
            updateContainerAndView(backViewColor: #colorLiteral(red: 0.01578908414, green: 0.05948520452, blue: 0.08061487228, alpha: 1), firstContainer: true, secondContainer: false, thirdContainer: true, fourthContainer: true, resetTintColor: .white, resetBackColor: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), allAzkarTinitColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), zekrTitleTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

        case 2:
            updateContainerAndView(backViewColor: #colorLiteral(red: 0.4158618748, green: 0.38296175, blue: 0.06294912845, alpha: 1), firstContainer: true, secondContainer: true, thirdContainer: false, fourthContainer: true, resetTintColor: .white, resetBackColor: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), allAzkarTinitColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), zekrTitleTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            
        case 3:
            updateContainerAndView(backViewColor: #colorLiteral(red: 0.8138887286, green: 0.8476147056, blue: 0.8732982278, alpha: 1), firstContainer: true, secondContainer: true, thirdContainer: true, fourthContainer: false, resetTintColor: .white, resetBackColor: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), allAzkarTinitColor: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), zekrTitleTextColor: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))
            
        default:
            break
        }
    }
    private func updateContainerAndView(backViewColor:UIColor,
                                firstContainer:Bool,
                                secondContainer:Bool,
                                thirdContainer:Bool,
                                fourthContainer:Bool,
                                resetTintColor:UIColor,
                                resetBackColor:UIColor,
                                allAzkarTinitColor:UIColor,
                                zekrTitleTextColor:UIColor){
        backView.backgroundColor = backViewColor
        self.secondContainer.isHidden = secondContainer
        self.firstContainer.isHidden = firstContainer
        self.thirdContainer.isHidden = thirdContainer
        self.fourthContainer.isHidden = fourthContainer
        resetBtn.tintColor = resetTintColor
        resetBtn.backgroundColor = resetBackColor
        allAzkarButton.tintColor = allAzkarTinitColor
        zekrTitleLabel.textColor = zekrTitleTextColor
    }
    
    // MARK: -  segues for conatiners to be able to access all container properties and function from the main view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFirstContainer"{
            let vc = segue.destination as! FirstContainerViewController
            firstContainerVC = vc
        }else if segue.identifier == "toSecondContainer"{
            let vc = segue.destination as!SecondContainerViewController
            secondContainerVC = vc
        }else if segue.identifier == "toThirdContainer"{
            let vc = segue.destination as!ThirdContainerViewController
            thirdContainerVC = vc
        }else{
            let vc = segue.destination as!FourthConatinerViewController
            fourthContainerVC = vc
        }
    }
//    to resset counter and stroke to zero
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        clickNo = 0
        firstContainerVC?.mainView.progressLayer.strokeEnd = 0.0
        secondContainerVC?.mainView.progressLayer.strokeEnd = 0.0
        thirdContainerVC?.mainView.progressLayer.strokeEnd = 0.0
        fourthContainerVC?.mainView.progressLayer.strokeEnd = 0.0

        totalCounterNo()
    }
    
    func totalCounterNo() {
        if clickNo <= 100 && totalCounter <= 100{
            totalCounter = clickNo
            firstContainerVC?.counterLabel.text = String(clickNo)
            secondContainerVC?.counterLabel.text = String(clickNo)
            thirdContainerVC?.counterLabel.text = String(clickNo)
            fourthContainerVC?.counterLabel.text = String(clickNo)
        }else{
            totalCounter += 1
            firstContainerVC?.counterLabel.text = String(totalCounter)
            secondContainerVC?.counterLabel.text = String(totalCounter)
            thirdContainerVC?.counterLabel.text = String(totalCounter)
            fourthContainerVC?.counterLabel.text = String(totalCounter)
        }
        
    }
}


   
    


