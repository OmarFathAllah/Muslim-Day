//
//  PrayerTimesCollectionViewCell.swift
//  Collection inside collection -demo
//
//  Created by omar  on 06/09/2022.
//

import UIKit

class PrayerTimesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fajrLabel: UILabel!
    @IBOutlet weak var fajrImage: UIImageView!
    @IBOutlet weak var fajrTime: UILabel!
    
    @IBOutlet weak var shroukLabel: UILabel!
    @IBOutlet weak var shroukImage: UIImageView!
    @IBOutlet weak var shroukTime: UILabel!
    
    @IBOutlet weak var dhuhrLabel: UILabel!
    @IBOutlet weak var dhuhrImage: UIImageView!
    @IBOutlet weak var dhuhrTime: UILabel!
    
    @IBOutlet weak var asrLabel: UILabel!
    @IBOutlet weak var asrImage: UIImageView!
    @IBOutlet weak var asrTime: UILabel!
    
    @IBOutlet weak var maghribLabel: UILabel!
    @IBOutlet weak var maghribImage: UIImageView!
    @IBOutlet weak var maghribTime: UILabel!
    
    @IBOutlet weak var ishaLabel: UILabel!
    @IBOutlet weak var ishaImage: UIImageView!
    @IBOutlet weak var ishaTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
// cell setup
    func prayerTimeCellSetup(timingModel: Timings){
        fajrLabel.text = "Fajr"
        fajrImage.image = UIImage(systemName: "sun.haze")
        fajrTime.text = timingModel.fajr.removeEETfromTiming()
        
        shroukLabel.text = "Shrouk"
        shroukImage.image = UIImage(systemName: "sunrise")
        shroukTime.text = timingModel.sunrise.removeEETfromTiming()
        
        dhuhrLabel.text = "dhuhr"
        dhuhrImage.image = UIImage(systemName: "sun.max")
        dhuhrTime.text = timingModel.dhuhr.removeEETfromTiming()
        
        asrLabel.text = "Asr"
        asrImage.image = UIImage(systemName: "sunset")
        asrTime.text = timingModel.asr.removeEETfromTiming()
        
        maghribLabel.text = "maghrib"
        maghribImage.image = UIImage(systemName: "sunset")
        maghribTime.text = timingModel.maghrib.removeEETfromTiming()
        
        ishaLabel.text = "Isha"
        ishaImage.image = UIImage(systemName: "moon")
        ishaTime.text = timingModel.isha.removeEETfromTiming()
    }
}
