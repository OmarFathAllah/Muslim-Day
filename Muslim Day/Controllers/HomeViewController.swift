//
//  FirstViewController.swift
//  Azkar Almuslim
//
//  Created by omar  on 16/01/2022.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController{
   
//    properties
    var timingData : PrayerTiming?
    var timingArray:[String] = []
    var timingAsDate:[Date] = []
    var fajr:String?
    var shrouk:String?
    var zuhr:String?
    var asr:String?
    var maghrib:String?
    var isha:String?

    
    @IBOutlet var azkarButton: UIButton!
    @IBOutlet var quranButton: VerticalIconTextButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var allPrayerTimesStack: UIStackView!
    @IBOutlet weak var allPrayersBtn: UIButton!
    @IBOutlet weak var commingPrayerTime: UILabel!
    @IBOutlet weak var nowAndComingPrayer: UILabel!
    @IBOutlet weak var prayerName: UILabel!
    @IBOutlet weak var HijriDateLabel: UILabel!
    @IBOutlet weak var MiladiDateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var fajrTime: UILabel!
    @IBOutlet weak var shroukTime: UILabel!
    @IBOutlet weak var zuhrTime: UILabel!
    @IBOutlet weak var asrTime: UILabel!
    @IBOutlet weak var maghribTime: UILabel!
    @IBOutlet weak var ishaTime: UILabel!
    
    
    @IBOutlet weak var fajrStackView: UIStackView!
    @IBOutlet weak var shroukStackView: UIStackView!
    @IBOutlet weak var zuhrStackView: UIStackView!
    @IBOutlet weak var asrStackView: UIStackView!
    @IBOutlet weak var maghribStackView: UIStackView!
    @IBOutlet weak var ishaStackView: UIStackView!
        
    let locationManger = CLLocationManager()

//    view did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewSetUp()
        activityIndicator.startAnimating()
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.requestLocation()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
  
    func updatePrayerTimingUI(){
        self.fajrTime.text = self.timingData?.data?.timings?.fajr
        self.shroukTime.text = self.timingData?.data?.timings?.sunrise
        self.zuhrTime.text = self.timingData?.data?.timings?.dhuhr
        self.asrTime.text = self.timingData?.data?.timings?.asr
        self.maghribTime.text = self.timingData?.data?.timings?.maghrib
        self.ishaTime.text = self.timingData?.data?.timings?.isha
        self.HijriDateLabel.text =  self.timingData?.data?.date?.hijri?.date
        self.dayNameLabel.text = self.timingData?.data?.date?.hijri?.weekday?.ar
        self.commingPrayerTime.text = getNextPrayer()
        self.MiladiDateLabel.text = TimeManager.shared.currentDateAsString()
    }
    
    func intializePrayerTimingVariables(){
         fajr = self.timingData?.data?.timings?.fajr
        shrouk = self.timingData?.data?.timings?.sunrise
         zuhr = self.timingData?.data?.timings?.dhuhr
         asr = self.timingData?.data?.timings?.asr
         maghrib = self.timingData?.data?.timings?.maghrib
         isha = self.timingData?.data?.timings?.isha
         //  appending values to timing array
        timingArray.append(TimeManager.shared.currentDateAsString() + " " + fajr!)
        timingArray.append(TimeManager.shared.currentDateAsString() + " "  + shrouk!)
        timingArray.append(TimeManager.shared.currentDateAsString() + " "  + zuhr!)
        timingArray.append(TimeManager.shared.currentDateAsString() + " "  + asr!)
        timingArray.append(TimeManager.shared.currentDateAsString() + " "  + maghrib!)
        timingArray.append(TimeManager.shared.currentDateAsString() + " "  + isha!)
//        print(timingArray)
        
        //   converting timingArray from string to Date and appending dte values into timingAsData Array
        for timeAsString in timingArray{
            let date = TimeManager.shared.fromStringToDate(timeAsString: timeAsString, dateFormate: "dd-MM-yyyy HH:mm")
            guard let safeDate = date else {return}
            timingAsDate.append(safeDate)
            //        print(timingAsDate)
        }
    }
    
    //    get next payer function
    func getNextPrayer() -> String {
        var nextPrayer:Date?
        let dateAndTimeAsString = TimeManager.shared.currentDateAndTime()
//            print("current String date is : \(dateAndTimeAsString)")
        
//          let dateAndTimeAsString = "10/06/2022, 3:36 AM"
        let dateAndTimeAsDate = TimeManager.shared.fromStringToDate(timeAsString: dateAndTimeAsString, dateFormate: "dd/MM/yyyy, h:mm a")
//            print("time As Date \(dateAndTimeAsDate)")
            for prayerTime in timingAsDate{
            if prayerTime > dateAndTimeAsDate! {
//                print("comparison: \(prayerTime) versus \(Date())")
                nextPrayer = prayerTime
                switch prayerTime{
                case timingAsDate[0]:
                    prayerName.text = "Alfajr"
                case timingAsDate[1]:
                    prayerName.text = "AlShrouk"
                case timingAsDate[2]:
                    prayerName.text = "AlZuhr"
                case timingAsDate[3]:
                    prayerName.text = "AlAsr"
                case timingAsDate[4]:
                    prayerName.text = "AlMaghrib"
                case timingAsDate[5]:
                    prayerName.text = "Alisha"
                default:
                    prayerName.text = " "
                }
                break
            }
        }
        if nextPrayer != nil{
            let commingPrayertimeAsString = TimeManager.shared.dateToString(nextPrayerdate: nextPrayer!, dateFormate: "h:mm a")
//            print("commingPrayertimeAsString :: \(commingPrayertimeAsString)")
            return commingPrayertimeAsString
        }else{
            prayerName.text = "Alfajr"
            return timingArray[0]
        }
    }
    @IBAction func getCurrentLocationPressed(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        locationManger.requestLocation()
    }
    // MARK: -      main view custom shape
    func mainViewSetUp(){
        ishaStackView.layer.cornerRadius = 6
        ishaStackView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        ishaStackView.layer.borderWidth = 1
        ishaStackView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        maghribStackView.layer.cornerRadius = 6
        maghribStackView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        maghribStackView.layer.borderWidth = 1
        maghribStackView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        asrStackView.layer.cornerRadius = 6
        asrStackView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        asrStackView.layer.borderWidth = 1
        asrStackView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        zuhrStackView.layer.cornerRadius = 6
        zuhrStackView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        zuhrStackView.layer.borderWidth = 1
        zuhrStackView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        shroukStackView.layer.cornerRadius = 6
        shroukStackView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        shroukStackView.layer.borderWidth = 1
        shroukStackView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        fajrStackView.layer.cornerRadius = 6
        fajrStackView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        fajrStackView.layer.borderWidth = 1
        fajrStackView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
// MARK: -  CL locatiom Manager Delegate

extension HomeViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManger.stopUpdatingLocation()
            getLocationName(location:location)
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
//        let url = "https://api.aladhan.com/v1/timingsByCity?city=Cairo&country=Egypt&method=5"
//        let url = "https://api.aladhan.com/v1/calendar?latitude=31.106094&longitude=31.120294&method=5&month=6&year=2022"
        let url = "https://api.aladhan.com/v1/timings"
        let parameters = ["latitude":"\(latitude)","longitude":"\(longitude)","method":"5"] as [String : Any]
        NetworkService.shared.getAzanData(url: url, parameters: parameters) { (result) in
                switch result{
                case.success(let prayerTiming):
                    self.timingData = prayerTiming
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
            //    print("Timing data is :  \(self.timingData)")
                    DispatchQueue.main.async {
                        self.updatePrayerTimingUI()
                    }
                    self.intializePrayerTimingVariables()
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
//    get location name acoording to user current location
    func getLocationName(location:CLLocation){
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (places, error) in
            guard let place = places?.first, error == nil else { return }
            let curentLocationName = place.name
            self.locationLabel.text = curentLocationName
//            print(curentLocationName)
        }
    }
}

