//
//  PrayerTimesCollectionViewCell.swift
//  Collection inside collection -demo
//
//  Created by omar  on 06/09/2022.
//

import UIKit

class PrayerTimesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var prayerName: UILabel!
    @IBOutlet weak var prayerImage: UIImageView!
    @IBOutlet weak var prayerTiming: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
// cel setup
    func prayerTimeCellSetup(timingModel: PrayerTimingModel){
        prayerName.text = timingModel.paryerName
        prayerImage.image = UIImage(named: timingModel.prayerImage)
        prayerTiming.text = timingModel.prayerTime
        
    }
}
