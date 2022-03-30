//
//  SingleSeasonTableViewCell.swift
//  Dragedex
//
//  Created by Majka on 30/03/2022.
//

import UIKit

class SingleSeasonTableViewCell: UITableViewCell {
    @IBOutlet var seasonNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: SeasonModel?) {
        guard let model = model else {
            return
        }
        seasonNumberLabel.text = model.seasonNumber
    }
    
}
