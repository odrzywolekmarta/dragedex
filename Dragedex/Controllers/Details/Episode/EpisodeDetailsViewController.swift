//
//  EpisodeDetailsViewController.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

protocol EpisodeDetailsViewModelProtocol {
    var model: EpisodeModel { get }
    func getChallenges(completion: (Result<[ChallengeModel], Error>) -> Void)
    func getLipsyncs(completion: (Result<[LipSyncModel], Error>) -> Void)
}

class MockEpisodeDetailsViewModel: EpisodeDetailsViewModelProtocol {
    let model: EpisodeModel
    let dataProvider = MockDataProvider()
    private var cachedChallenges: [ChallengeModel]?
    private var cachedLipsyncs: [LipSyncModel]?
    
    init(model: EpisodeModel) {
        self.model = model
    }
    
    func getChallenges(completion: (Result<[ChallengeModel], Error>) -> Void) {
        if let cached = cachedChallenges {
            completion(.success(cached))
            return
        }
        
        do {
            let challenges = try dataProvider.getTestChallenges()
            cachedChallenges = challenges
            completion(.success(challenges))
        } catch {
            completion(.failure(error))
        }
    }
    
    func getLipsyncs(completion: (Result<[LipSyncModel], Error>) -> Void) {
        if let cached = cachedLipsyncs {
            completion(.success(cached))
            return
        }
        
        do {
            let lipsyncs = try dataProvider.getTestLipsyncs()
            completion(.success(lipsyncs))
        } catch {
            completion(.failure(error))
        }
    }
}

class EpisodeDetailsViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var challengesButton: UIButton!
    @IBOutlet var lipsyncsButton: UIButton!
    
    @IBAction func challengesButtonTapped(_ sender: Any) {
        viewModel.getChallenges { result in
            switch result {
            case .success(let models):
                router.pushChallenges(with: models)
            case .failure(let error):
                // handle error
                ()
            }
        }
    }
    
    @IBAction func lipsyncsButtonTapped(_ sender: Any) {
        viewModel.getLipsyncs { result in
            switch result {
            case .success(let models):
                router.pushLipsyncs(with: models)
            case .failure(let error):
                //handle error
                ()
            }
        }
    }
    
    let viewModel: EpisodeDetailsViewModelProtocol
    let router: TabRouterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        doConfiguration()
    }
    
    init(viewModel: EpisodeDetailsViewModelProtocol, router: TabRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func doConfiguration() {
        titleLabel.text = viewModel.model.title
        updateEnabledStatusForChallengesButton()
        updateEnabledStatusForLipsyncsButton()
    }
    
    func updateEnabledStatusForChallengesButton() {
        viewModel.getChallenges { result in
            switch result {
            case .success:
                challengesButton.isEnabled = true
            case .failure:
                challengesButton.isEnabled = false
            }
        }
    }
    
    func updateEnabledStatusForLipsyncsButton() {
        viewModel.getLipsyncs { result in
            switch result {
            case .success:
                lipsyncsButton.isEnabled = true
            case .failure:
                lipsyncsButton.isEnabled = false
            }
        }
    }
}
