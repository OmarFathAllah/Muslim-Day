//
//  DetaileViewController.swift
//  playSound
//
//  Created by omar  on 22/05/2022.
//

import UIKit
import AVFoundation
//import SideMenu

class PlayerViewController: UIViewController {
    
//    properities
    static let identifier = String(describing: PlayerViewController.self)
//    let menuListController = MenuListController()
    var reciterName: String = "ماهر بن حمد المعيقلي"
    var mp3Url:String = "https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/quran/get-recitation/728787/ar/json"
//    var menu:SideMenuNavigationController?
    var player:AVPlayer?
    var quranDataArray:[SurahsReference] = GetDataFromJsonFile.shared.getQuranDataFromJson()
    var mp3Links = [Attachmentss]()
    var trackNo:Int = 0
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var reciterButton: UIButton!
    @IBOutlet weak var nextPreviousBackView: UIView!
    @IBOutlet weak var previousSurahButton: UIButton!
    @IBOutlet weak var nextSurahButton: UIButton!
    @IBOutlet weak var playerBackView: UIView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var startDurationLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var forrwardButton: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var arabicSuraName: UILabel!
    @IBOutlet weak var englishSuraName: UILabel!
    @IBOutlet weak var suraMeaning: UILabel!
    @IBOutlet weak var noOfSura: UILabel!
    @IBOutlet weak var noOfAyahs: UILabel!
    @IBOutlet weak var revelationPlace: UILabel!
    
    // MARK: -  View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
//        menu = SideMenuNavigationController(rootViewController: MenuListController())
//        menu?.leftSide = true
//        SideMenuManager.default.leftMenuNavigationController = menu
        cellViewSetup()
        detailViewSetup()
        activityIndicator.startAnimating()
        
        viewsOrder()
        nextPreviousViewSetUp()
        changeNextPreviousButtonTitle()
        reciterButton.setTitle("ماهر بن حمد المعيقلي", for: .normal)
    }
    
//    view will Appear
    override func viewWillAppear(_ animated: Bool) {
        NetworkService.shared.getMp3QuranLinks(url: mp3Url) { (result) in
            switch result{
            case .success(let value):
                self.mp3Links = value.attachments
                self.setupPlayer()
//                print(self.mp3Links)
            case .failure(let error):
                print(error)
            }
        }
    }
 
 //   calling this function to remove the observer after view willDissapear
     override func viewWillDisappear(_ animated: Bool) {
         NotificationCenter.default.removeObserver(self)
     }
    
    // MARK: -  function to order back view for player details to bring the view in front 

    func viewsOrder(){
        self.view.bringSubviewToFront(backView)
        self.view.sendSubviewToBack(nextPreviousBackView)
    }
    
    // MARK: -  play Button Pressed

    @IBAction func playPauseButtonPressed(_ sender: UIButton) {
        if player?.rate != 0 {
//            print("player will be paused")
//           pause playing
            player?.pause()
            sender.setImage(UIImage(systemName: "play"), for: .normal)
           
        }else{
//            print("player is going to be played")
//            setup play
            player?.play()
            sender.setImage(UIImage(systemName: "pause"), for: .normal)
        }
    }
    // MARK: -  setup player
    func setupPlayer(){
        let urlString = mp3Links[trackNo].url
//        print("url as string \(urlString)")
        guard let asURL = URL(string: urlString)else { return }
//        print(asURL)
        let playerItem = AVPlayerItem(url: asURL)
            player = AVPlayer(playerItem: playerItem)
            player!.volume = 1.0
            player!.play()
            player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
        
        //        Adding observer to observe # playerItem when finshed playing track to the end
            NotificationCenter.default.addObserver(self, selector: #selector (finishedPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
       
//        track player progress
        let interval = CMTime(value: 1, timescale: 2)
        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (ProgressTime) in
            
            let seconds = CMTimeGetSeconds(ProgressTime)
            let secondsText = Int(seconds) % 60
            let minutesText = Int(seconds) / 60
//            print("seconds is: \(seconds)")
//            print("secondsText is: \(secondsText)")
            self.startDurationLabel.text = "\(minutesText):\(secondsText)"
            
            //lets move the slider thumb
            if let duration = self.player?.currentItem?.duration {
                let durationSeconds = CMTimeGetSeconds(duration)
                
                self.progressSlider.value = Float(seconds / durationSeconds)
            }
            
        })

    }
    var duration:CMTime?
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.loadedTimeRanges"{
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            if let duration =  player?.currentItem?.duration,duration != .indefinite {
                let seconds = CMTimeGetSeconds(duration)
                let secondText = Int(seconds) % 60
                let minutesText = Int(seconds) / 60
                durationLabel.text = "\(minutesText):\(secondText)"
            }
        }
    }
//    this function to be excuted when observer observe that AVPlayerItemDidPlayToEndTime
    @objc func finishedPlaying(myNotification: NSNotification){
         let stoppeddPlayerItem: AVPlayerItem = myNotification.object as! AVPlayerItem
        stoppeddPlayerItem.seek(to: CMTime.zero) { (isEnded) in
            if isEnded{
                if self.trackNo < (self.mp3Links.count - 1){
                    self.trackNo += 1
                    self.changeNextPreviousButtonTitle()
                    DispatchQueue.main.async {
                        self.detailViewSetup()
                    }
                    self.setupPlayer()
                }
            }
        }
     }
    
    // MARK: -  backward button pressed
    @IBAction func backwardButtonPressed(_ sender: UIButton) {
        changeNextPreviousButtonTitle()
        if trackNo > 0{
            trackNo -= 1
            changeNextPreviousButtonTitle()
            DispatchQueue.main.async {
                self.detailViewSetup()
            }
            setupPlayer()
        }
    }
    // MARK: -  forward Button Pressed
    
    @IBAction func forwardButtonPressed(_ sender: UIButton) {
        if trackNo < (mp3Links.count - 1){
            trackNo += 1
            changeNextPreviousButtonTitle()
            DispatchQueue.main.async {
                self.detailViewSetup()
            }
            setupPlayer()
        }
    }
    // MARK: -  Next Surah Button
    @IBAction func nextSurahButtonPressed(_ sender: UIButton) {
        if trackNo < (mp3Links.count - 1){
            trackNo += 1
            changeNextPreviousButtonTitle()
            DispatchQueue.main.async {
                self.detailViewSetup()
            }
            setupPlayer()
        }
    }
    
    
    // MARK: -  Previous Surah Button
    @IBAction func previousSurahButtonPresed(_ sender: UIButton) {
        changeNextPreviousButtonTitle()
        if trackNo > 0{
            trackNo -= 1
            changeNextPreviousButtonTitle()
            DispatchQueue.main.async {
                self.detailViewSetup()
            }
            setupPlayer()
        }
    }
    

//    to be used for presenting side menu if needed
//    @IBAction func reciterMenuButtonPressed(_ sender: UIButton) {
//        present(menu!, animated: true, completion: nil)
//    }
    
//    Reciters button pressed to get more reciters from the table view
    @IBAction func reciterButtonPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: RecitersViewController.identifier)as! RecitersViewController
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        dismiss(animated: true) {
//            self.player?.pause()
            self.player = nil
        }
    }
    
    // MARK: -  Change surah name for next and previous buttons
    func changeNextPreviousButtonTitle(){
        switch trackNo{
        case 0:
            nextSurahButton.setTitle(quranDataArray[trackNo+1].name, for: .normal)
            previousSurahButton.setTitle("No previous", for: .normal)
            previousSurahButton.isEnabled = false
        case 113:
            nextSurahButton.setTitle("No Next", for: .normal)
            previousSurahButton.setTitle(quranDataArray[trackNo-1].name, for: .normal)
            nextSurahButton.isEnabled = false
        default:
            nextSurahButton.setTitle(quranDataArray[trackNo+1].name, for: .normal)
            previousSurahButton.setTitle(quranDataArray[trackNo-1].name, for: .normal)
        }
    }
    
    // MARK: -  changing track progress using slider
    @IBAction func sliderChanded(_ sender: UISlider) {
        if let duration = player?.currentItem?.duration {
            let totalSeconds = CMTimeGetSeconds(duration)
            
            let value = Float64(progressSlider.value) * totalSeconds
            
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            
            player?.seek(to: seekTime, completionHandler: { (completedSeek) in
                //perhaps do something later here
            })
        }
    }
    
    // MARK: -  setup for cell view

    func cellViewSetup(){
        backView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        backView.layer.borderWidth = 2
        backView.layer.cornerRadius = 17
        
        noOfSura.layer.cornerRadius = noOfSura.frame.size.height/2
        noOfSura.layer.cornerRadius = noOfSura.frame.size.width/2
        
        noOfSura.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        noOfSura.layer.borderWidth = 3
    }

    // MARK: -  Next and previous view setUP
    func nextPreviousViewSetUp(){
        nextPreviousBackView.layer.cornerRadius = 17
        nextPreviousBackView.layer.borderWidth = 2
        nextPreviousBackView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        nextSurahButton.layer.cornerRadius = nextSurahButton.frame.size.height/2
        nextSurahButton.layer.borderColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        nextSurahButton.layer.borderWidth = 1
        
        previousSurahButton.layer.cornerRadius = previousSurahButton.frame.size.height/2
        previousSurahButton.layer.borderColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        previousSurahButton.layer.borderWidth = 1
    }

    

    // MARK: -  setup for deatil view

    func detailViewSetup(){
        arabicSuraName.text = quranDataArray[trackNo].name
        englishSuraName.text = quranDataArray[trackNo].englishName
        suraMeaning.text = quranDataArray[trackNo].englishNameTranslation
        noOfSura.text = "\(quranDataArray[trackNo].number)"
        noOfAyahs.text = "\(quranDataArray[trackNo].numberOfAyahs) Ayah"
        revelationPlace.text = quranDataArray[trackNo].revelationType.rawValue
    }

}
extension PlayerViewController:PassDataToPlayer{
    func passTitle(title: String) {
        DispatchQueue.main.async {
            self.reciterButton.setTitle(title, for: .normal)
            self.player = nil
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
//        print("title from delegate at player \(title)")
    }
    
    func pasUrl(url: String) {
//        print("delgeate url from player:  \(url)")
//        mp3Url = url
        NetworkService.shared.getMp3QuranLinks(url: url) { (result) in
            switch result{
            case .success(let value):
                self.mp3Links = value.attachments
//                print(self.mp3Links)
                self.setupPlayer()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func changeSurahFromAll(url:String){
        NetworkService.shared.getMp3QuranLinks(url: url) { (result) in
            switch result{
            case .success(let value):
                self.player = nil
                self.mp3Links = value.attachments
                self.setupPlayer()
//                print(self.mp3Links)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
