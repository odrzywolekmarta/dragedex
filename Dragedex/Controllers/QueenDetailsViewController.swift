//
//  QueenDetailsViewController.swift
//  Dragedex
//
//  Created by Majka on 21/03/2022.
//

import UIKit
import SDWebImage

protocol QueenDetailsViewModelProtocol {
    func getQueen(completion: (Result<QueenModel, Error>) -> Void)
}

class QueenDetailsViewController: UIViewController {
    @IBOutlet var queensImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var seasonsLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    
    var viewModel: QueenDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doConfiguration()
        presentQueenDetails()
    }
    
    func doConfiguration() {
    }
    
    func presentQueenDetails() {
        viewModel?.getQueen { result in
            switch result {
            case .success(let model):
                handle(model: model)
            case .failure(let error):
                handle(error: error)
            }
        }
    }
    
    func handle(model: QueenModel) {
        nameLabel.text = model.name
        quoteLabel.text = "\"\(model.quote)\""
        
        let seasonsNumbers = model.seasons.map {
            $0.seasonNumber
        }.joined(separator: ", ")
        let seasonsText = "Seasons: \(seasonsNumbers)"
        seasonsLabel.text = seasonsText
        
        if model.winner {
            winnerLabel.text = "Winner"
        } else {
            winnerLabel.isHidden = true
        }

        queensImageView.sd_setImage(with: URL(string: model.imageUrl),
                                    placeholderImage: nil)
    }
    
    func handle(error: Error) {
    }
}
