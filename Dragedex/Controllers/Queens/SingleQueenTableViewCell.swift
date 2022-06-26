//
//  SingleQueenTableViewCell.swift
//  Dragedex
//
//  Created by Majka on 23/03/2022.
//

import UIKit

class SingleQueenTableViewCell: UITableViewCell {
    @IBOutlet var queenImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var winnerImageView: UIImageView!
    
    private var latestImageLoadingOperationKey: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.applyShadow()
        queenImageView.makeRound()
        containerView.layer.cornerRadius = 8
        winnerImageView.makeRound()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: QueenModel?, shouldDisplaySpoilers: Bool) {
        guard let model = model else {
            return
        }
        queenImageView.sd_cancelImageLoadOperation(withKey: latestImageLoadingOperationKey)
        if let urlString = model.imageUrl, let url = URL(string: urlString) {
            queenImageView.sd_setImage(with: url)
            latestImageLoadingOperationKey = queenImageView.sd_latestOperationKey
        }
        
        nameLabel.text = model.name
                
        if model.winner && shouldDisplaySpoilers {
            winnerImageView.isHidden = false
        } else {
            winnerImageView.isHidden = true
        }
    }
}
