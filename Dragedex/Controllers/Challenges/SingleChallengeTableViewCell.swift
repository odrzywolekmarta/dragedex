//
//  SingleChallengeTableViewCell.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

class SingleChallengeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: ChallengeModel?) {
        guard let model = model else {
            return
        }
    }
}
