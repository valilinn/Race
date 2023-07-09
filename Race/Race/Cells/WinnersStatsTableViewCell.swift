//
//  WinnersStatsTableViewCell.swift
//  Race
//
//  Created by Валентина Лінчук on 09/07/2023.
//

import UIKit

class WinnersStatsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var winnerImageView: UIImageView!
   
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
