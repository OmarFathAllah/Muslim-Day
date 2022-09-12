//
//  HomeViewController.swift
//  Azkar Almuslim
//
//  Created by omar  on 16/01/2022.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController{
   
    // MARK: -  outlets and variables
    var timingData : PrayerTimingForMonthModel?
    let date = Date()
    var index = 0
    
    @IBOutlet weak var PrayerTimesCollectionView: UICollectionView!
    @IBOutlet var azkarButton: UIButton!
    @IBOutlet var quranButton: VerticalIconTextButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var allPrayersBtn: UIButton!
    @IBOutlet weak var commingPrayerTime: UILabel!
    @IBOutlet weak var nowAndComingPrayer: UILabel!
    @IBOutlet weak var prayerName: UILabel!
    @IBOutlet weak var HijriDateLabel: UILabel!
    @IBOutlet weak var MiladiDateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
        
    let locationManger = CLLocationManager()

    // MARK: -  View did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.requestLocation()
        registerPrayerCollectionCell()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

//    register prayerTiming collection view cell
    func registerPrayerCollectionCell(){
        PrayerTimesCollectionView.delegate = self
        PrayerTimesCollectionView.dataSource = self
        PrayerTimesCollectionView.register(UINib(nibName: "PrayerTimesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PrayerTimesCollectionViewCell")
    }
    
    /*
    //    get next payer function
    func getNextPrayer() -> String {
        var nextPrayer:Date?
        let dateAndTimeAsString = DateHelper.shared.currentDateAndTimeAsString()
//            print("current String date is : \(dateAndTimeAsString)")
        
//          let dateAndTimeAsString = "10/06/2022, 3:36 AM"
        let dateAndTimeAsDate = DateHelper.shared.fromStringToDate(timeAsString: dateAndTimeAsString, dateFormate: "dd/MM/yyyy, h:mm a")
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
            let commingPrayertimeAsString = DateHelper.shared.dateToString(nextPrayerdate: nextPrayer!, dateFormate: "h:mm a")
//            print("commingPrayertimeAsString :: \(commingPrayertimeAsString)")
            return commingPrayertimeAsString
        }else{
            prayerName.text = "Alfajr"
            return timingArray[0]
        }
    }
     */
    @IBAction func getCurrentLocationPressed(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        locationManger.requestLocation()
    }
    
    // MARK: -  update current date hijri and miladi
    func updateDateUI(timingData:PrayerTimingForMonthModel){
        self.HijriDateLabel.text = timingData.data[self.index].date.hijri.date
        self.MiladiDateLabel.text = timingData.data[self.index].date.gregorian.date
        self.dayNameLabel.text = timingData.data[self.index].date.gregorian.weekday.en
    }
    
    // MARK: -  get next prayer and update there UI
    func getNextPrayer(timing:Timings){
        if let prayerTiming = self.timingData{
            let currentDateAsString = DateHelper.shared.currentDateAndTimeAsString()
            
//              let currentDateAsString = "12/09/2022, 9:36 PM"
            if let currentDateAsDate = DateHelper.shared.fromStringToDate(timeAsString: currentDateAsString, dateFormate: "dd/MM/yyyy, h:mm a"){
//            let currentDateAndTime = DateHelper.shared.currentDateAndTimeAsDate()
                let nextPrayerDate = NextPrayerTime.shared.getNextPrayerByIteratePrayerTiming(prayertimingModel: prayerTiming.data[self.index].timings, currentDate: currentDateAsDate)
    //            print("next Prayer time is -> \(nextPrayerDate)")
                let nextPrayerDateAsString = DateHelper.shared.dateToString(nextPrayerdate: nextPrayerDate!.paryerDate, dateFormate: "h:mm a")
                    commingPrayerTime.text = "\(nextPrayerDateAsString)"
                    prayerName.text = nextPrayerDate?.prayerName
            }
        }
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
//        let url = "https://api.aladhan.com/v1/calendar?latitude=31.106094&longitude=31.120294&method=5&month=8&year=2022"
//        let url = "https://api.aladhan.com/v1/timings" this base url only get timing for the current date day only but need also lattitude and lnogitude and method of calculations
            let baseUrl = "https://api.aladhan.com/v1/calendar"
            let currentMonth = date.get(component: .month)
            let currentYear = date.get(component: .year)
        let parameters = ["latitude":"\(latitude)","longitude":"\(longitude)","method":"5","month":"\(currentMonth)","year":"\(currentYear)"] as [String : Any]
        NetworkService.shared.getAzanData(url: baseUrl, parameters: parameters) { (result) in
                switch result{
                case.success(let prayerTiming):
                    self.timingData = prayerTiming
                    self.index = CurrentTimingIndex.shared.getTimingIndex(date: self.date, n: (self.timingData?.data.count)!)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
            //    print("Timing data is :  \(self.timingData)")
                    guard let timingData = self.timingData else { return }
                    self.getNextPrayer(timing:timingData.data[self.index].timings)
                    DispatchQueue.main.async {
                        self.PrayerTimesCollectionView.reloadData()
                        guard let timingData = self.timingData else { return }
                        self.updateDateUI(timingData:timingData)
                    }
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

// MARK: -  Prayer collection view delegate and data source
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrayerTimesCollectionViewCell", for: indexPath)as! PrayerTimesCollectionViewCell
      
        if let timingData = timingData?.data[index].timings{
            cell.prayerTimeCellSetup(timingModel: (timingData))
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


