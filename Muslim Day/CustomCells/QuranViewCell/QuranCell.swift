//
//  QuranCell.swift
//  Azkar Almuslim
//
//  Created by omar  on 29/01/2022.
//

import UIKit

class QuranCell: UITableViewCell {
    static let identifier = String(describing: QuranCell.self)

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var arabicSuraName: UILabel!
    @IBOutlet weak var englishSuraName: UILabel!
    @IBOutlet weak var suraMeaning: UILabel!
    @IBOutlet weak var noOfSura: UILabel!
    @IBOutlet weak var playButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
      cellViewSetup()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellViewSetup(){
        backView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        backView.layer.borderWidth = 2
        backView.layer.cornerRadius = 17
        
        noOfSura.layer.cornerRadius = noOfSura.frame.size.height/2
        noOfSura.layer.cornerRadius = noOfSura.frame.size.width/2
        
        noOfSura.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        noOfSura.layer.borderWidth = 3
        
        textLabel?.layer.masksToBounds = true
    }
    
    func cellContentSetup(cellData:SurahsReference){
        arabicSuraName.text = cellData.name
        englishSuraName.text = cellData.englishName
        suraMeaning.text = cellData.englishNameTranslation
        noOfSura.text = "\(cellData.number)"
    }
}
