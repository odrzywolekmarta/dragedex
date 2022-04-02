//
//  SingleLipsyncTableViewCell.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

class SingleLipsyncTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: LipSyncModel?) {
        guard let model = model else {
            return
        }
    }
    
}
