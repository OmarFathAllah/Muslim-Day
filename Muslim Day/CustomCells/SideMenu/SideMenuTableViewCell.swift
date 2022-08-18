//
//  SideMenuTableViewCell.swift
//  playSound
//
//  Created by omar  on 29/05/2022.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    static let identifier = String(describing: SideMenuTableViewCell.self)

    @IBOutlet weak var cellTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
