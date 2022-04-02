//
//  ChallengesTableViewController.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

protocol ChallengesViewModelProtocol {
    var dataSource: [ChallengeModel] { get }
    func updateDataSource()
}
class ChallengesTableViewController: UITableViewController {
    
    let viewModel: ChallengesViewModelProtocol
    let router: TabRouterProtocol
    
    init(viewModel: ChallengesViewModelProtocol,
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
        reloadData()
    }
    
    func reloadData() {
        viewModel.updateDataSource()
        tableView.reloadData()
    }

    func configureTableView() {
        let cellName = String(describing: SingleChallengeTableViewCell.self)
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SingleChallengeTableViewCell.self),
                                                    for: indexPath) as? SingleChallengeTableViewCell {
            cell.configure(with: viewModel.dataSource[indexPath.row])
            return cell
        }
        return SingleChallengeTableViewCell()
    }
}
