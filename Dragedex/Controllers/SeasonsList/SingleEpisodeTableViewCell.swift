//
//  SingleEpisodeTableViewCell.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

class SingleEpisodeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: EpisodeModel?) {
        guard let model = model else {
            return
        }
    }
}
