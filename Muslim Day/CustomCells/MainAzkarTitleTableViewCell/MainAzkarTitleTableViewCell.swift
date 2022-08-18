//
//  MainAzkarTitleTableViewCell.swift
//  playSound
//
//  Created by omar  on 11/06/2022.
//

import UIKit

class MainAzkarTitleTableViewCell: UITableViewCell {
    var identifier = "MainAzkarTitleTableViewCell"
    
    @IBOutlet weak var mainCellView: UIView!
    @IBOutlet weak var cellLabelText: UILabel!
    @IBOutlet weak var zekrTitleNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellSetUp()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellSetUp(){
        mainCellView.layer.shadowColor = UIColor.black.cgColor
        mainCellView.layer.shadowOffset = .zero
        mainCellView.layer.cornerRadius = 25
        mainCellView.layer.shadowOpacity = 0.1
        mainCellView.layer.shadowRadius = 10
        mainCellView.layer.borderWidth = 0.5
        mainCellView.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.8843897333)
        
//        zekrTitleNo.layer.cornerRadius = zekrTitleNo.frame.height / 2
//        zekrTitleNo.layer.cornerRadius = zekrTitleNo.frame.width / 2
//        zekrTitleNo.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        zekrTitleNo.layer.borderWidth = 1
    }
}
