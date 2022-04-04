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
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var seasonsLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var episodesButton: UIButton!
    @IBOutlet var challengesButton: UIButton!
    @IBOutlet var lipsyncsButton: UIButton!
    @IBOutlet var cardContainterView: UIView!
    
    let viewModel: QueenDetailsViewModelProtocol
    let router: TabRouterProtocol
    init(viewModel: QueenDetailsViewModelProtocol,
         router: TabRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        doConfiguration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = .none
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
    }
    
    func doConfiguration() {
        updateUI(with: viewModel.model)
        queensImageView.makeRound()
        cardContainterView.applyShadow()
        cardContainterView.layer.cornerRadius = 8
        cardContainterView.clipsToBounds = true
        episodesButton.addTarget(self, action: #selector(episodesButtonTapped), for: .touchUpInside)
        challengesButton.addTarget(self, action: #selector(challengesButtonTapped), for: .touchUpInside)
        lipsyncsButton.addTarget(self, action: #selector(lipsyncsButtonTapped), for: .touchUpInside)
        let detailsBackgroundColor = queensImageView.image?.averageColor
        view.backgroundColor = detailsBackgroundColor
        let barColor = view.backgroundColor?.lighter()
        navigationController?.navigationBar.barTintColor = barColor
        let barItemsColor = navigationController?.navigationBar.barTintColor?.inverted
        navigationController?.navigationBar.tintColor = barItemsColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:barItemsColor ?? .black]
        let buttonColor = view.backgroundColor?.adjustBrightness()
        episodesButton.backgroundColor = buttonColor
        challengesButton.backgroundColor = buttonColor
        lipsyncsButton.backgroundColor = buttonColor
        episodesButton.tintColor = buttonColor?.inverted
        challengesButton.tintColor = buttonColor?.inverted
        lipsyncsButton.tintColor = buttonColor?.inverted
        episodesButton.layer.cornerRadius = 23
        challengesButton.layer.cornerRadius = 23
        lipsyncsButton.layer.cornerRadius = 23
        episodesButton.applyShadow()
        challengesButton.applyShadow()
        lipsyncsButton.applyShadow()
        
    }
    
    @objc func episodesButtonTapped() {
        router.pushEpisodes(with: viewModel.model)
    }
    
    @objc func challengesButtonTapped() {
        router.pushChallenges(with: viewModel.model)
    }
    
    @objc func lipsyncsButtonTapped() {
        router.pushLipsyncs(with: viewModel.model)
    }
    
    func fetchAdditionalQueenData() {
        viewModel.getAdditionalQueenData { result in
            switch result {
            case .success(let model):
                updateUI(with: model)
            case .failure(let error):
                handle(error: error)
            }
        }
    }
    
    func updateUI(with model: QueenModel) {
        quoteLabel.text = "\"\(model.quote)\""
        title = model.name
//        let color = UIColor.lightGray
//        view.backgroundColor = color
        
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
