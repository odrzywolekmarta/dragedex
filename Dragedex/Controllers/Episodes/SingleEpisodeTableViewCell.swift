//
//  SingleEpisodeTableViewCell.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

class SingleEpisodeTableViewCell: UITableViewCell {
    @IBOutlet var episodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: EpisodeModel?) {
        guard let model = model else {
            return
        }
        episodeLabel.text = "\(model.episodeInSeason). \(model.title)"
    }
}
