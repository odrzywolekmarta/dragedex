//
//  QueensTableViewController.swift
//  Dragedex
//
//  Created by Majka on 23/03/2022.
//

import UIKit

protocol QueensViewModelProtocol {
    var delegate: QueensViewModelDelegate? { get set }
    var dataSource: [QueenModel] { get }
    func updateDataSource()
    func shouldDisplaySpoilers() -> Bool
}

protocol QueensViewModelDelegate: AnyObject {
    func onDataSourceUpdate(error: Error?)
}

class QueensViewModel: QueensViewModelProtocol {
    func shouldDisplaySpoilers() -> Bool {
        UserDefaults.standard.bool(forKey: Constants.kShouldDisplaySpoilers)
    }
    
    weak var delegate: QueensViewModelDelegate?
    let service = QueensAPIService()
    var dataSource: [QueenModel] = []
    
    func updateDataSource() {
        service.getAllQueens { [weak self] result in
            switch result {
            case .success(let models):
                self?.dataSource = models
                self?.delegate?.onDataSourceUpdate(error: nil)
            case .failure(let error):
                self?.delegate?.onDataSourceUpdate(error: error)
            }
        }
    }
}

class QueensTableViewController: UITableViewController {
    
    var viewModel: QueensViewModelProtocol
    let router: TabRouterProtocol
    
    init(viewModel: QueensViewModelProtocol,
         router: TabRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
        viewModel.updateDataSource()
        viewModel.delegate = self
    }
    
    func configureTableView() {
        let cellName = String(describing: SingleQueenTableViewCell.self)
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        navigationItem.title = "Queens"
    }
    
    func configureNavigationBar() {
        let spoilersLabel = UILabel()
        spoilersLabel.font = UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize)
        spoilersLabel.text = "spoilers"
        spoilersLabel.textColor = .gray
        
        let toggle = UISwitch()
        toggle.addTarget(self, action: #selector(toggleValueChanged(_:)), for: .valueChanged)
        toggle.onTintColor = .systemPink
        toggle.isOn = viewModel.shouldDisplaySpoilers()
        
        let stackView = UIStackView(arrangedSubviews: [spoilersLabel,toggle])
        stackView.spacing = 8
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stackView)
    }
    
    @objc func toggleValueChanged(_ toggle: UISwitch) {
        let shouldDisplaySpoilers = toggle.isOn
        UserDefaults.standard.set(shouldDisplaySpoilers, forKey: Constants.kShouldDisplaySpoilers)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SingleQueenTableViewCell.self),
                                                    for: indexPath) as? SingleQueenTableViewCell {
            cell.configure(with: viewModel.dataSource[indexPath.row], shouldDisplaySpoilers: viewModel.shouldDisplaySpoilers())
            cell.backgroundColor = .clear
            return cell
        }
        return SingleQueenTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.pushQueenDetails(with: viewModel.dataSource[indexPath.row])
    }
}

extension QueensTableViewController: QueensViewModelDelegate {
    func onDataSourceUpdate(error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                self.presentAlert(with: error)
            } else {
                self.tableView.reloadData()
            }
        }
    }
}
