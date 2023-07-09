//
//  OtherStatsTableViewCell.swift
//  Race
//
//  Created by Валентина Лінчук on 09/07/2023.
//

import UIKit

class OtherStatsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var playerNumber: UILabel!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
