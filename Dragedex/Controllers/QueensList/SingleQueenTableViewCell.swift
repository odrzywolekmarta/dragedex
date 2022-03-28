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
    
    private var latestImageLoadingOperationKey: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: QueenModel?) {
        guard let model = model else {
            return
        }
        queenImageView.sd_cancelImageLoadOperation(withKey: latestImageLoadingOperationKey)
        if let urlString = model.imageUrl, let url = URL(string: urlString) {
            queenImageView.sd_setImage(with: url)
            latestImageLoadingOperationKey = queenImageView.sd_latestOperationKey
        }
        nameLabel.text = model.name
    }
    
}
