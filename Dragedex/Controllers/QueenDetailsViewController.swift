//
//  QueenDetailsViewController.swift
//  Dragedex
//
//  Created by Majka on 21/03/2022.
//

import UIKit
import SDWebImage

protocol QueenDetailsViewModelProtocol {
    var model: QueenModel { get }
    func getAdditionalQueenData(completion: (Result<QueenModel, Error>) -> Void)
}

class QueenDetailsViewModel: QueenDetailsViewModelProtocol {
    var model: QueenModel
    init(with model: QueenModel) {
        self.model = model
    }
    func getAdditionalQueenData(completion: (Result<QueenModel, Error>) -> Void) {
    }
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
    }
    
    func doConfiguration() {
        if let model = viewModel?.model {
            updateUI(with: model)
        }
    }
    
    func fetchAdditionalQueenData() {
        viewModel?.getAdditionalQueenData { result in
            switch result {
            case .success(let model):
                updateUI(with: model)
            case .failure(let error):
                handle(error: error)
            }
        }
    }
    
    func updateUI(with model: QueenModel) {
        nameLabel.text = model.name
        quoteLabel.text = "\"\(model.quote)\""
        
        if let seasonsNumbers = model.seasonsDescription {
            seasonsLabel.text = seasonsNumbers
        } else {
            seasonsLabel.isHidden = true
        }
        
        if let wonSeason = model.seasons?.first(where: {$0.place == 1}) {
            winnerLabel.text = "\(wonSeason.seasonNumber) winner"
        } else {
            winnerLabel.isHidden = true
        }
        
        if let urlString = model.imageUrl {
            queensImageView.sd_setImage(with: URL(string: urlString),
                                        placeholderImage: nil)
        }
        
    }
    
    func handle(error: Error) {
    }
}
