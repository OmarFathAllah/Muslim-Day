//
//  AzkarCell.swift
//  Azkar Almuslim
//
//  Created by omar  on 07/01/2022.
//

import UIKit

class AzkarCell: UITableViewCell {

    @IBOutlet weak var cellBackView: UIView!
    @IBOutlet weak var azkarLabel: UILabel!
    @IBOutlet weak var repeatLabel: UILabel!
    @IBOutlet weak var repaetNo: UILabel!
    @IBOutlet weak var repeatView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellBackView.layer.cornerRadius = 30
        
        cellBackView.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        cellBackView.layer.borderWidth = 1
        cellBackView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cellBackView.layer.shadowRadius = 3
        cellBackView.layer.shadowOffset = .zero
        
        repeatView.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        repeatView.layer.borderColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.5)
        repeatView.layer.borderWidth = 1

        repeatView.layer.cornerRadius = 12
        
        repaetNo.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        repaetNo.layer.cornerRadius = 15
        
        repeatLabel.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        repeatLabel.layer.cornerRadius = 15
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
